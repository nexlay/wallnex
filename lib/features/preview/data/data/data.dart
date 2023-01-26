import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';



abstract class SetImageAsWallpaper {
//Set as Wallpaper
  Future<bool> setWallpaper(String path, int screen);
}

class SetImageAsWallpaperImpl implements SetImageAsWallpaper {
  @override
  Future<bool> setWallpaper(String path, int screen) async {
    // WallpaperManager.HOME_SCREEN = 1;
    // WallpaperManager.LOCK_SCREEN = 2;
    // WallpaperManager.BOTH_SCREEN = 3;
    try {
      return await WallpaperManager.setWallpaperFromFile(path, screen);
    } on PlatformException {
      'Failed to set Wallpaper.';
      return false;
    }
  }



}