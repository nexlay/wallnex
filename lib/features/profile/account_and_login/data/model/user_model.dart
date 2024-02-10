import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';

class LocalUserModel extends LocalUser {
  const LocalUserModel({
    required super.uId,
    required super.email,
    required super.name,
    required super.photoUrl,
    required super.isAnonymous,
  });

  factory LocalUserModel.fromAuthUser(User? user) {
    if (user != null) {
      return LocalUserModel(
        uId: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        photoUrl: user.photoURL ?? '',
        isAnonymous: user.isAnonymous,
      );
    } else {
      return const LocalUserModel(
        uId: '',
        email: '',
        name: '',
        photoUrl: '',
        isAnonymous: true,
      );
    }
  }

  factory LocalUserModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      [SnapshotOptions? options]) {
    final data = snapshot.data();
    return LocalUserModel(
      email: data?['email'],
      name: data?['name'],
      uId: data?['uId'],
      photoUrl: data?['photoUrl'],
      isAnonymous: data?['isAnonymous'] ?? false,
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'email': email,
      'name': name,
      'uId': uId,
      'photoUrl': photoUrl,
      'iSAnonymous': isAnonymous,
    };
  }
}
