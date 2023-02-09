import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import 'package:wallnex/features/profile/account_and_login/data/database/firebase_db.dart';
import 'package:wallnex/features/profile/account_and_login/data/model/user_model.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';

class FirebaseRepoImpl implements FirebaseRepo {
  final FirebaseAuthDb firebaseDb;

  FirebaseRepoImpl({required this.firebaseDb});

  @override
  Stream<UserModel> get user {
    return firebaseDb.userModel;
  }

  @override
  Future<Either<LocalFailure, void>> getUrl(
      XFile file) async {
    try {
      final url = await firebaseDb.updatePhotoUrl(file);
      return Right(url);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
