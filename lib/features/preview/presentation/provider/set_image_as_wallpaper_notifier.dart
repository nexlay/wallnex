import 'package:flutter/material.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/set_image_as_wallpaper_use_case.dart';

class SetImageASWallpaperNotifier extends ValueNotifier<int> {
  final SetImageAsWallpaperUseCase _setImageAsWallpaperUseCase;

  SetImageASWallpaperNotifier(this._setImageAsWallpaperUseCase) : super(0);

  bool loading = false;
  String error = '';

  Future<void> setImageAsWallpaper(String filePath, int screen) async {
    final result = await _setImageAsWallpaperUseCase
        .call(UrlAndPage(params1: filePath, params2: screen));

    result.fold(
      (fail) => error = fail.toString(),
      (result) {
        if (result) {
          loading = false;
          notifyListeners();
        } else {
          error;
        }
      },
    );
  }

  void setLoading(bool isLoading, int screen) {
    loading = isLoading;
    value = screen;
    notifyListeners();
  }

  void reset() {
    error = '';
    loading = false;
    value = 0;
    notifyListeners();
  }
}
