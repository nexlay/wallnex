import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wallnex/features/profile/account_and_login/domain/usecase/get_user_use_case.dart';
import '../../../../images/domain/entities/wallpaper.dart';
import '../../domain/entities/user.dart';
import '../../domain/usecase/get_profile_photo_url_use_case.dart';

class UserAuthChangeNotifier extends ChangeNotifier{
  UserAuthChangeNotifier(this._getUserUseCase, this._updateProfilePhotoUseCase, );


  final GetUserUseCase _getUserUseCase;
  final UpdateProfilePhotoUrlUseCase _updateProfilePhotoUseCase;


  bool isLoading = false;

  bool isFavorite = false;
  List<Wallpaper> favorites = [];
  String error = '';

  Stream<LocalUser> get user {
    return _getUserUseCase.user;
  }


  Future<void> getUrl (XFile file) async {
    await _updateProfilePhotoUseCase.updatePhotoUrl(file);
  }
}
