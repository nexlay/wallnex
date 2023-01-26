import 'package:flutter/material.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/set_image_as_wallpaper_use_case.dart';

class SetImageASWallpaperNotifier extends ChangeNotifier {
  SetImageAsWallpaperUseCase setImageAsWallpaperUseCase;

  SetImageASWallpaperNotifier({required this.setImageAsWallpaperUseCase});

  bool loading = false;
  String error = '';
  int setScreen = 0;

  Future<void> setImageAsWallpaper(
      String filePath, int screen) async {
    loading = true;
    notifyListeners();

    final result = await setImageAsWallpaperUseCase
        .call(ParamsIntAndString(st: filePath, number: screen));

    result.fold((fail) {
      error = fail.toString();
    }, (result) {
      if (result) {
        loading = result;
        setScreen = screen;
      }
    });
    notifyListeners();
  }

  void resetScreenIndex() {
    setScreen = 0;
    notifyListeners();
  }
}
