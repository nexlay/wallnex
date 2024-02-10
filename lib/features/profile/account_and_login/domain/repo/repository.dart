import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';

abstract class UserRepo {
  Stream<LocalUser> get user;

  ///Storage
  Future<Either<LocalFailure, void>> updateUserPhoto();

  ///DB
  Future<Either<Failure, void>> deleteAllDataFromFirebaseDb();
  Future<Either<Failure, void>> createUser();
}
