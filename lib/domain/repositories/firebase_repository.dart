import 'package:arkatrack/common/utils/either.dart';
import 'package:firebase_auth/firebase_auth.dart';

class FirebaseRepository {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<Either<String, User>> signUpWithEmailAndPassword({
    required String email,
    required String password,
  }) async {
    try {
      final userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      return Right(userCredential.user!);
    } on FirebaseAuthException catch (e) {
      final errorMessages = {
        'weak-password': 'The password provided is too weak.',
        'email-already-in-use': 'The account already exists for that email.',
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
}
