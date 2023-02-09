import 'package:hive/hive.dart';
import '../../../images/data/models/wallpaper_model.dart';
import '../../../images/domain/entities/wallpaper.dart';

abstract class LocalDb {
//Favorites Hive DB
  Future<List<WallpaperModel>> getFavorites();
  Future<void> updateFavorite(Wallpaper wallpaper);
  Future<void> addToFavorite(Wallpaper wallpaper);
  Future<void> deleteFromFavorite(String id);
  Future<bool> checkFavorites(String id);
}

class FavoritesDatabaseImpl implements LocalDb {
  @override
  Future<void> addToFavorite(Wallpaper wallpaper) async {
    // get the previously opened box
    final favoriteBox = Hive.box<Wallpaper>('favorites');
    await favoriteBox.put(wallpaper.id, wallpaper);
  }

  @override
  Future<void> updateFavorite(Wallpaper wallpaper) async {}

  @override
  Future<void> deleteFromFavorite(String id) async {
    // get the previously opened box
    final favoriteBox = Hive.box<Wallpaper>('favorites');
    await favoriteBox.delete(id);
  }

  @override
  Future<List<WallpaperModel>> getFavorites() async {
    final favoriteBox = await Hive.openBox<Wallpaper>('favorites');
    return Future.value(
        favoriteBox.values.map((e) => WallpaperModel.fromIterable(e)).toList());
  }

  @override
  Future<bool> checkFavorites(String id) async {
    // get the previously opened box
    final favoriteBox = await Hive.openBox<Wallpaper>('favorites');
    var contain = favoriteBox.values.toList().where(
          (element) => element.toString().contains(id),
        );
    if (contain.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
