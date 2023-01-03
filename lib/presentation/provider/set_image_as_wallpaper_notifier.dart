import 'package:flutter/material.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/usecases/set_image_as_wallpaper_use_case.dart';

import '../common/ui/show_snack_bar.dart';

class SetImageASWallpaperNotifier extends ChangeNotifier {
  SetImageAsWallpaperUseCase setImageAsWallpaperUseCase;

  SetImageASWallpaperNotifier({required this.setImageAsWallpaperUseCase});

  bool loading = false;

  String error = '';

  Future<void> setImageAsWallpaper(
      String path, int screen, BuildContext context) async {
    loading = true;
    notifyListeners();

    final result = await setImageAsWallpaperUseCase
        .call(ParamsTwo(params: path, param: screen));

    result.fold((fail) {
      error = fail.toString();
    }, (result) {
      if (result) {
        loading = false;
        showSnackBar(context, 'Wallpaper updated');
        notifyListeners();
      } else {
        showSnackBar(context, 'Something went wrong');
        notifyListeners();
      }
    });
    notifyListeners();
  }
}
