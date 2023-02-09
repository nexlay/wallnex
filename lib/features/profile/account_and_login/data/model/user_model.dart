import 'package:firebase_auth/firebase_auth.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';

class UserModel extends LocalUser {
  const UserModel({
    required super.uId,
    required super.email,
    required super.name,
    required super.isAnonymous,
  });

  bool get a => isAnonymous;

  factory UserModel.fromAuthUser(User? user) {
    if (user != null) {
      return UserModel(
        uId: user.uid,
        email: user.email ?? '',
        name: user.displayName ?? '',
        isAnonymous: user.isAnonymous,
      );
    } else {
      return const UserModel(
        uId: '',
        email: '',
        name: '',
        isAnonymous: true,
      );
    }
  }
}
