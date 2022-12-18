import 'package:flutter/material.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/usecases/set_image_as_wallpaper_use_case.dart';

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
        _showSnackBar(context, 'Wallpaper updated');
      } else {
        _showSnackBar(context, 'Something went wrong');
      }
    });
    notifyListeners();
  }

  void _showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      margin: const EdgeInsets.only(bottom: 100.0, left: 70, right: 70),
      content: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
              height: 50,
              width: 50,
              child: Image.asset('assets/core/launch_image.png'),),
          Text(text, style: const TextStyle(color: Colors.white),),
        ],
      ),
      behavior: SnackBarBehavior.floating,
      elevation: 2.0,
      duration: const Duration(milliseconds: 3000),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
