import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/profile/account_and_login/domain/entities/user.dart';

abstract class FirebaseRepo {
  Stream<LocalUser> get user;

  Future<Either<LocalFailure, void>> getUrl (XFile file);


}
