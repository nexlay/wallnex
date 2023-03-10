import 'package:wallnex/features/favorites/data/data/remote_database.dart';
import 'package:wallnex/features/images/data/models/wallpaper_model.dart';
import 'local_database.dart';

abstract class SyncDatabases {
  Future<List<WallpaperModel>> sync();
}

class SyncDatabaseImpl implements SyncDatabases {
  final RemoteDb remote;
  final LocalDb local;

  SyncDatabaseImpl({required this.remote, required this.local});

  @override
  Future<List<WallpaperModel>> sync() async {
    final remoteFavorites = await remote.getFavoritesFromFireStore();
    final localFavorites = await local.getFavorites();

    if (localFavorites.length > remoteFavorites.length) {
      for (var element in localFavorites) {
        if (!remoteFavorites.contains(element)) {
          await remote.addToFireStore(element);
        }
      }
      return localFavorites;
    } else if (remoteFavorites.length > localFavorites.length) {
      for (var element in remoteFavorites) {
        if (!localFavorites.contains(element)) {
          await local.addToFavorite(element);
        }
      }
      return localFavorites;
    }
    return localFavorites;
  }
}
