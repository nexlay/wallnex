import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import 'package:wallnex/features/profile/account_and_login/data/database/firebase_db.dart';
import 'package:wallnex/features/profile/account_and_login/data/model/user_model.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';

class FirebaseRepoImpl implements UserRepo {
  final FirebaseAuthDb firebaseDb;

  FirebaseRepoImpl({required this.firebaseDb});

  @override
  Stream<LocalUserModel> get user {
    return firebaseDb.userModel;
  }

  @override
  Future<Either<LocalFailure, void>> updateUserPhoto() async {
    try {
      final url = await firebaseDb.updatePhotoUrl();
      return Right(url);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> deleteAllDataFromFirebaseDb() async {
    try {
      final delete = await firebaseDb.deleteAllUserData();
      return Right(delete);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> createUser() async {
    try {
      final createUser = await firebaseDb.createUser();
      return Right(createUser);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
