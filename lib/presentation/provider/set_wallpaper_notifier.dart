import 'package:flutter/cupertino.dart';
import 'package:wallnex/domain/usecases/set_image_as_wallpaper.dart';

class SetWallpaperNotifier extends ChangeNotifier{
  final SetImageAsWallpaper setImageAsWallpaper;
  SetWallpaperNotifier ({required this.setImageAsWallpaper});

  bool isLoading = false;
  String res = '';

  Future<void> setWallpaper (String path) async {
    // show loading
    isLoading = true;
    notifyListeners();
    final result = await setImageAsWallpaper(Params(path: path),);

    notifyListeners();
  }
}