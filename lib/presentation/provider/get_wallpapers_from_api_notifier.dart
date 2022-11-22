import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/domain/usecases/get_wallpaper_use_case.dart';

class GetWallpapersNotifier extends ChangeNotifier {
  final GetWallpaperUseCase getWallpaperUseCase;
  GetWallpapersNotifier({required this.getWallpaperUseCase});

  bool isLoading = false;
  List<Wallpaper> imageList = [];
  String error = '';

  Future<void> loadAllWallpapers() async {
    // show loading
    isLoading = true;
    notifyListeners();

    // Fetch the list
    final result = await getWallpaperUseCase(
      NoParams(),
    );

    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (list) {
        imageList = list;
        isLoading = false;
      },
    );

    // notify UI
    notifyListeners();
  }
}
