import 'dart:developer';

import 'package:arkatrack/common/utils/either.dart';
import 'package:arkatrack/domain/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<Either<String, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      final user = userCredential.user;

      if (user == null) {
        return Left('User creation failed.');
      }

      await _firestore.collection('users').doc(user.uid).set({
        'email': user.email,
        'createdAt': FieldValue.serverTimestamp(),
      }).then((value) => log('User added to Firestore'));

      return Right(user);
    } on FirebaseAuthException catch (e) {
      final errorMessages = {
        'weak-password': 'The password provided is too weak.',
        'email-already-in-use': 'The account already exists for that email.',
      };

      final errorMessage = errorMessages[e.code];
      return Left(errorMessage ?? 'An unknown error occurred.');
    } catch (e) {
      return Left('An unexpected error occurred.');
    }
  }

  Future<Either<String, User>> signInWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      final errorMessages = {
        'user-not-found': 'No user found for that email.',
        'wrong-password': 'Wrong password provided for that user.',
      };

      final errorMessage = errorMessages[e.code];

      if (errorMessage != null) {
        return Left(errorMessage);
      } else {
        return Left('An unknown error occurred.');
      }
    } catch (e) {
      return Left('An unexpected error occurred.');
    }
  }

  Future<void> signOut() => _firebaseAuth.signOut();

  User? get currentUser => _firebaseAuth.currentUser;

  Stream<User?> get authStateChanges => _firebaseAuth.authStateChanges();

  Future<Either<String, UserModel>> updateProfile({
    required String displayName,
    required String photoURL,
    required PhoneAuthCredential phoneNumber,
    required String email,
    required String role,
  }) async {
    final user = _firebaseAuth.currentUser;

    if (user == null) {
      return Left('No user is currently signed in.');
    }

    try {
      await Future.wait([
        user.updateDisplayName(displayName),
        user.updatePhotoURL(photoURL),
        user.updatePhoneNumber(phoneNumber),
        user.verifyBeforeUpdateEmail(email),
      ]);

      await user.reload();
      final updatedUser = _firebaseAuth.currentUser!;

      final userModel = UserModel.fromUser(updatedUser);

      await _firestore.collection('users').doc(updatedUser.uid).set(
            userModel.toJson()
              ..addAll({
                'role': role,
                'updatedAt': FieldValue.serverTimestamp(),
              }),
            SetOptions(merge: true),
          );

      return Right(userModel);
    } on FirebaseAuthException catch (e) {
      final errorMessages = {
        'invalid-email': 'The email address is invalid.',
        'email-already-in-use':
            'The email is already in use by another account.',
        'requires-recent-login':
            'Please reauthenticate to update sensitive information.',
      };

      final errorMessage = errorMessages[e.code];
      return Left(errorMessage ??
          'An unknown error occurred while updating the profile.');
    } catch (e) {
      return Left('An unexpected error occurred: ${e.toString()}');
    }
  }

  Future<Either<String, UserModel>> getUserData(String userId) async {
    try {
      final doc = await _firestore.collection('users').doc(userId).get();

      if (doc.exists) {
        return Right(UserModel.fromJson(doc.data()!));
      } else {
        return Left('No user data found for ID: $userId');
      }
    } catch (e) {
      return Left('Error fetching user data: $e');
    }
  }

  Future<Either<String, List<UserModel>>> getAllUsers() async {
    try {
      final querySnapshot = await _firestore.collection('users').get();

      final users = querySnapshot.docs.map((doc) {
        return UserModel.fromJson(doc.data());
      }).toList();

      return Right(users);
    } catch (e) {
      return Left('Error fetching users: $e');
    }
  }
}
