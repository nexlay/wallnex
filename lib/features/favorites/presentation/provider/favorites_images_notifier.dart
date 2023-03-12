import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/favorites/domain/usecase/delete_from_local_db.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../../domain/usecase/add_to_firestore.dart';
import '../../domain/usecase/add_to_local_db_use_case.dart';
import '../../domain/usecase/delete_from_firestore.dart';
import '../../domain/usecase/get_favorites.dart';

class FavoritesNotifier extends ChangeNotifier {
  final AddToLocalDbUseCase _addToLocalUseCase;
  final DeleteFromLocalDbUseCase _deleteFromLocalDbUseCase;
  final AddToFireStoreUseCase _addToFireStoreUseCase;
  final DeleteFromFireStoreUseCase _deleteFromFireStoreUseCase;
  final GetFavorites _getFavorites;

  FavoritesNotifier(
    this._addToLocalUseCase,
    this._addToFireStoreUseCase,
    this._deleteFromFireStoreUseCase,
    this._deleteFromLocalDbUseCase,
    this._getFavorites,
  );

  bool isLoading = false;
  List<Wallpaper> favorites = [];
  String error = '';

  Future<void> getFavorites() async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await _getFavorites.call(NoParams());
    // Handle success or error
    result.fold(
      (e) => error = e.toString(),
      (r) {
        favorites = r;
        isLoading = false;
        // notify UI
        notifyListeners();
      },
    );
  }

  Future<void> insertIntoFavorites(Wallpaper wallpaper) async {
    // show loading

    wallpaper.isFavorite = true;
    notifyListeners();

    await _addToLocalUseCase.call(ParamsImage(params: wallpaper));

    await _addToFireStoreUseCase
        .call(ParamsImage(params: wallpaper))
        .whenComplete(() {
      favorites.add(wallpaper);
      notifyListeners();
    });
  }

  Future<void> deleteFromFavorites(Wallpaper wallpaper) async {
    wallpaper.isFavorite = false;
    notifyListeners();

    await _deleteFromLocalDbUseCase.call(
      ParamsImage(params: wallpaper),
    );
    await _deleteFromFireStoreUseCase
        .call(ParamsString(params: wallpaper.id))
        .whenComplete(() {
      favorites.remove(wallpaper);
      notifyListeners();
    });
  }
}
