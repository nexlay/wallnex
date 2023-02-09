import 'package:flutter/material.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/set_image_as_wallpaper_use_case.dart';

class SetImageASWallpaperNotifier extends ValueNotifier<int> {
  final SetImageAsWallpaperUseCase _setImageAsWallpaperUseCase;

  SetImageASWallpaperNotifier(this._setImageAsWallpaperUseCase) : super(0);

  bool loading = false;
  String error = '';

  Future<void> setImageAsWallpaper(String filePath, int screen) async {
    loading = true;
    value = screen;
    notifyListeners();

    final result = await _setImageAsWallpaperUseCase
        .call(UrlAndPage(url: filePath, page: screen));

    result.fold((fail) {
      error = fail.toString();
    }, (result) {
      if (result) {
        loading = result;
      }
    });
    notifyListeners();
  }
}
