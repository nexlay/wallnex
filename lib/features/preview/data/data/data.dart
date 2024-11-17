import 'dart:io';
import 'package:flutter/services.dart';
import 'package:wallpaper_manager_plus/wallpaper_manager_plus.dart';

abstract class SetImageAsWallpaper {
//Set as Wallpaper
  Future<bool> setWallpaper(String path, int screen);
}

class SetImageAsWallpaperImpl implements SetImageAsWallpaper {
  @override
  Future<bool> setWallpaper(String path, int screen) async {
    // WallpaperManagerPlus.homeScreen = 1;
    // WallpaperManagerPlus.lockScreen = 2;
    // WallpaperManagerPlus.bothScreens = 3;
    try {
      await WallpaperManagerPlus().setWallpaper(File(path), screen);
      return true;
    } on PlatformException {
      'Failed to set Wallpaper.';
      return false;
    }
  }
}
