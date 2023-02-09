import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../../domain/usecase/add_to_firestore.dart';
import '../../domain/usecase/add_update_delete_localDb_use_case.dart';
import '../../domain/usecase/delete_from_firestore.dart';
import '../../domain/usecase/get_favorites_use_case.dart';

class GetFavoritesNotifier extends ChangeNotifier {
  final AddDeleteUpdateUseCase _addDeleteUpdateUseCase;
  final AddToFireStoreUseCase _addToFareStoreUseCase;
  final DeleteFromFireStoreUseCase _deleteFromFireStoreUseCase;
  final GetFavoritesUseCase _getFavoritesUseCase;

  GetFavoritesNotifier(
      this._addDeleteUpdateUseCase,
      this._addToFareStoreUseCase,
      this._deleteFromFireStoreUseCase,
      this._getFavoritesUseCase);

  bool isLoading = false;

  bool isFavorite = false;
  List<Wallpaper> favorites = [];
  String error = '';

  Future<void> loadFavoritesWallpapers() async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await _getFavoritesUseCase.call(NoParams());
    // Handle success or error
    result.fold(
      (e) => error = e.toString(),
      (iterable) {
        favorites = iterable.toList();
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }

  Future<void> insertIntoFavorites(Wallpaper wallpaper) async {
    // show loading
    isLoading = true;
    notifyListeners();
    await _addDeleteUpdateUseCase
        .addFavoriteWallpaper(
      ParamsImage(wallpaper: wallpaper),
    )
        .whenComplete(() {
      isFavorite = true;
      loadFavoritesWallpapers();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> deleteFromFavorites(Wallpaper wallpaper) async {
    await _addDeleteUpdateUseCase
        .deleteFromFavorite(
      ParamsImage(wallpaper: wallpaper),
    )
        .whenComplete(() {
      loadFavoritesWallpapers();
      isFavorite = false;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> checkFavorites(Wallpaper wallpaper) async {
    isFavorite = false;
    notifyListeners();
    final result = await _addDeleteUpdateUseCase
        .checkFavorites(ParamsImage(wallpaper: wallpaper));
    result.fold((l) {
      error = "fail";
      isLoading = false;
      isFavorite = false;
    }, (r) {
      isFavorite = r;
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> addIntoFireStore(Wallpaper wallpaper) async {
    isLoading = true;
    notifyListeners();
    await _addToFareStoreUseCase
        .call(ParamsImage(wallpaper: wallpaper))
        .whenComplete(() {
      isFavorite = true;
      loadFavoritesWallpapers();
      isLoading = false;
      notifyListeners();
    });
  }

  Future<void> deleteFromFireStore(String imageId) async {
    await _deleteFromFireStoreUseCase
        .call(ParamsString(st: imageId))
        .whenComplete(() {
      isFavorite = false;
      loadFavoritesWallpapers();
      isLoading = false;
      notifyListeners();
    });
  }
}
