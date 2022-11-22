import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/domain/entities/favorite_wallpaper.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/domain/usecases/get_favorite_wallpapers_use_case.dart';

class GetFavoritesNotifier extends ChangeNotifier {
  final GetFavoriteWallpapers getFavoriteWallpapers;

  GetFavoritesNotifier({required this.getFavoriteWallpapers});

  bool isLoading = false;
  bool isOpened = false;
  bool isFavorite = false;
  List<FavoriteWallpaper> favorites = [];
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

  Future<void> openDatabase() async {
    await getFavoriteWallpapers.openDatabase(NoParams()).whenComplete(() {
      isOpened = true;
      notifyListeners();
    });
  }

  Future<void> insertIntoFavorites(Wallpaper wallpaper) async {
    // show loading
    isLoading = true;
    notifyListeners();
    await getFavoriteWallpapers
        .addFavoriteWallpaper(
      Params(wallpaper),
    )
        .whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> deleteFromFavorites(Wallpaper wallpaper) async {
    await getFavoriteWallpapers
        .deleteFromFavorite(
      Params(wallpaper),
    )
        .whenComplete(() {
      isLoading = false;
      notifyListeners();
    });
    notifyListeners();
  }

  Future<void> checkFavorites(Wallpaper wallpaper) async {
    final result =
        await getFavoriteWallpapers.checkFavorites(Params(wallpaper));
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
