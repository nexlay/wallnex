import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../features/images/domain/entities/wallpaper.dart';
import '../../features/images/domain/usecases/get_favorite_wallpapers_use_case.dart';

class GetFavoritesNotifier extends ChangeNotifier {
  final GetFavoriteWallpapersUseCase getFavoriteWallpapers;

  GetFavoritesNotifier({required this.getFavoriteWallpapers});

  bool isLoading = false;

  bool isFavorite = false;
  List<Wallpaper> favorites = [];
  String error = '';

  Future<void> loadFavoritesWallpapers() async {
    // show loading
    isLoading = true;
    notifyListeners();

    // Fetch the list
    final result = await getFavoriteWallpapers.call(NoParams());

    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (list) {
        favorites = list;

        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }

  Future<void> insertIntoFavorites(Wallpaper wallpaper) async {
    // show loading
    isLoading = true;
    favorites.add(wallpaper);
    notifyListeners();
    await getFavoriteWallpapers
        .addFavoriteWallpaper(
      Params(wallpaper: wallpaper),
    )
        .whenComplete(() {
      isFavorite = true;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> deleteFromFavorites(Wallpaper wallpaper) async {
    await getFavoriteWallpapers
        .deleteFromFavorite(
      Params(wallpaper: wallpaper),
    )
        .whenComplete(() {
      favorites.remove(wallpaper);
      isFavorite = false;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> checkFavorites(Wallpaper wallpaper) async {
    isFavorite = false;
    notifyListeners();
    final result = await getFavoriteWallpapers
        .checkFavorites(Params(wallpaper: wallpaper));
    result.fold((l) {
      error = "fail";
      isLoading = false;
      isFavorite = false;
    }, (r) {
      isFavorite = r;
      notifyListeners();
      isLoading = false;
    });
  }
}
