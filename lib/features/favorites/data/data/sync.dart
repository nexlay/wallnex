import 'package:wallnex/features/favorites/data/data/remote_database.dart';
import 'local_database.dart';

abstract class SyncDatabases {
  Future<void> sync();
}

class SyncDatabaseImpl implements SyncDatabases {
  final RemoteDb favoritesFirebaseDb;
  final LocalDb favoritesDatabase;

  SyncDatabaseImpl(this.favoritesFirebaseDb, this.favoritesDatabase);

  @override
  Future<void> sync() async {
    final remote = await favoritesFirebaseDb.getFavoritesFromFireStore();
    final local = await favoritesDatabase.getFavorites();
    for (var element in local) {
      if (!remote.contains(element)) {
        await favoritesFirebaseDb.addToFireStore(element);
      }
    }
  }
}
