import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';

abstract class UserRepo {
  Stream<LocalUser> get user;

  Future<Either<LocalFailure, void>> updateUserPhoto ();

  ///Storage
  Future<Either<Failure, void>> deleteAllDataFromFirebaseStorage();

}
