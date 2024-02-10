import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/profile/account_and_login/domain/usecase/write_user_data.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/delete_all_user_data.dart';
import '../../domain/usecase/get_local_user.dart';
import '../../domain/usecase/update_profile_photo_url.dart';

class LocalUserProvider extends ChangeNotifier {
  LocalUserProvider(
    this._getUserUseCase,
    this._updateProfilePhotoUseCase,
    this._deleteAllUserDataUseCase,
    this._writeUserDataUseCase,
  );

  final GetUserUseCase _getUserUseCase;
  final UpdateProfilePhotoUrlUseCase _updateProfilePhotoUseCase;
  final DeleteAllUserDataUseCase _deleteAllUserDataUseCase;
  final WriteUserDataUseCase _writeUserDataUseCase;

  Stream<LocalUser> get user {
    return _getUserUseCase.user;
  }

  Future<void> updateUserPhotoUrl() async {
    await _updateProfilePhotoUseCase.call(NoParams());
  }

  Future<void> writeUserDataIntoDb() async {
    await _writeUserDataUseCase.call(NoParams());
  }

  //TODO: Try to delete all user data
  /* Future<void> deleteFromFireStorage () async {
    await _deleteAllUserDataUseCase.call(NoParams());
  }*/
}
