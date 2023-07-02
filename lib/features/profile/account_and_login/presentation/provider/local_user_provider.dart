import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/delete_all_user_data.dart';
import '../../domain/usecase/get_local_user.dart';
import '../../domain/usecase/update_profile_photo_url.dart';

class LocalUserProvider{
  LocalUserProvider(
    this._getUserUseCase,
    this._updateProfilePhotoUseCase,
    this._deleteAllUserDataUseCase,
  );

  final GetUserUseCase _getUserUseCase;
  final UpdateProfilePhotoUrlUseCase _updateProfilePhotoUseCase;
  final DeleteAllUserDataUseCase _deleteAllUserDataUseCase;

  Stream<LocalUser> get user {
    return _getUserUseCase.user;
  }

  Future<void> updateUserPhotoUrl() async {
    await _updateProfilePhotoUseCase.call(NoParams());
  }

  //TODO: Try to delete all user data
  /* Future<void> deleteFromFireStorage () async {
    await _deleteAllUserDataUseCase.call(NoParams());
  }*/
}
