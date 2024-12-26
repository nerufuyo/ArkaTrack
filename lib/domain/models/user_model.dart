import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String? displayName;
  final String? email;
  final bool? isEmailVerified;
  final bool? isAnonymous;
  final UserMetadata? metadata;
  final String? phoneNumber;
  final String? photoURL;
  final List<UserInfo>? providerData;
  final String? refreshToken;
  final String? tenantId;
  final String? uid;

  UserModel({
    this.displayName,
    this.email,
    this.isEmailVerified,
    this.isAnonymous,
    this.metadata,
    this.phoneNumber,
    this.photoURL,
    this.providerData,
    this.refreshToken,
    this.tenantId,
    this.uid,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      displayName: json['displayName'],
      email: json['email'],
      isEmailVerified: json['isEmailVerified'],
      isAnonymous: json['isAnonymous'],
      metadata: UserMetadata.fromJson(json['metadata']),
      phoneNumber: json['phoneNumber'],
      photoURL: json['photoURL'],
      providerData: (json['providerData'] as List)
          .map((data) => UserInfo.fromJson(data))
          .toList(),
      refreshToken: json['refreshToken'],
      tenantId: json['tenantId'],
      uid: json['uid'],
    );
  }

  // Factory constructor to create a UserModel from a User object
  factory UserModel.fromUser(User user) {
    return UserModel(
      displayName: user.displayName,
      email: user.email,
      isEmailVerified: user.emailVerified,
      isAnonymous: user.isAnonymous,
      metadata: UserMetadata(
        creationTime: user.metadata.creationTime!,
        lastSignInTime: user.metadata.lastSignInTime!,
      ),
      phoneNumber: user.phoneNumber,
      photoURL: user.photoURL,
      providerData: user.providerData.map((data) {
        return UserInfo(
          displayName: data.displayName,
          email: data.email ?? '',
          phoneNumber: data.phoneNumber,
          photoURL: data.photoURL,
          providerId: data.providerId,
          uid: data.uid ?? '',
        );
      }).toList(),
      refreshToken: user.refreshToken,
      tenantId: user.tenantId,
      uid: user.uid,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'isEmailVerified': isEmailVerified,
      'isAnonymous': isAnonymous,
      'metadata': metadata?.toJson(),
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'providerData': providerData?.map((data) => data.toJson()).toList(),
      'refreshToken': refreshToken,
      'tenantId': tenantId,
      'uid': uid,
    };
  }
}

class UserMetadata {
  final DateTime creationTime;
  final DateTime lastSignInTime;

  UserMetadata({
    required this.creationTime,
    required this.lastSignInTime,
  });

  factory UserMetadata.fromJson(Map<String, dynamic> json) {
    return UserMetadata(
      creationTime: DateTime.parse(json['creationTime']),
      lastSignInTime: DateTime.parse(json['lastSignInTime']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'creationTime': creationTime.toIso8601String(),
      'lastSignInTime': lastSignInTime.toIso8601String(),
    };
  }
}

class UserInfo {
  final String? displayName;
  final String email;
  final String? phoneNumber;
  final String? photoURL;
  final String providerId;
  final String uid;

  UserInfo({
    this.displayName,
    required this.email,
    this.phoneNumber,
    this.photoURL,
    required this.providerId,
    required this.uid,
  });

  factory UserInfo.fromJson(Map<String, dynamic> json) {
    return UserInfo(
      displayName: json['displayName'],
      email: json['email'],
      phoneNumber: json['phoneNumber'],
      photoURL: json['photoURL'],
      providerId: json['providerId'],
      uid: json['uid'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'displayName': displayName,
      'email': email,
      'phoneNumber': phoneNumber,
      'photoURL': photoURL,
      'providerId': providerId,
      'uid': uid,
    };
  }
}
