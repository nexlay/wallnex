import 'package:dartz/dartz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/profile/account_and_login/domain/repo/repository.dart';

class UpdateProfilePhotoUrlUseCase {
  final FirebaseRepo firebaseRepo;

  UpdateProfilePhotoUrlUseCase({required this.firebaseRepo});

  Future<Either<LocalFailure, void>> updatePhotoUrl(
      XFile file) async {
    return await firebaseRepo.getUrl(file);
  }
}
