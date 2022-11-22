import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import '../models/favorite_wallpapers_model.dart';

abstract class LocalDatabase {
  Future<List<FavoriteWallpapersModel>> getFavoriteWallpapers();
  Future<void> setUpDatabase();
  Future<void> updateFavorite(Wallpaper wallpaper);
  Future<void> addToFavorite(Wallpaper wallpaper);
  Future<void> deleteFromFavorite(String id);
  Future<bool> checkFavorites(String id);
}

class LocalDatabaseImpl extends LocalDatabase {
  late final database;

  @override
  Future<void> setUpDatabase() async {
    database = openDatabase(
      join(await getDatabasesPath(), 'favorite_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE favorites(id INTEGER PRIMARY KEY AUTOINCREMENT, path TEXT, imageId TEXT, category TEXT, name TEXT, size TEXT, downloads TEXT, resolution TEXT, colors TEXT)',
        );
      },
      version: 1,
    );
  }

  @override
  Future<void> addToFavorite(Wallpaper wallpaper) async {
    final db = await database;
    await db.insert(
      'favorites',
      wallpaper.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  @override
  Future<void> updateFavorite(Wallpaper wallpaper) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Dog.
    await db.update(
      'favorites',
      wallpaper.toJson(),
      // Ensure that the Object has a matching id.
      where: 'imageId = ?',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [wallpaper.id],
    );
  }

  @override
  Future<void> deleteFromFavorite(String id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Dog from the database.
    await db.delete(
      'favorites',
      // Use a `where` clause to delete a specific Type.
      where: 'imageId = ?',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }

  @override
  Future<List<FavoriteWallpapersModel>> getFavoriteWallpapers() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table.
    final List maps = await db.query('favorites');

    // Convert the List<Map<String, dynamic> into a List<Type>.
    return Future.value(
      maps.map((e) => FavoriteWallpapersModel.fromJson(e)).toList(),
    );
  }

  @override
  Future<bool> checkFavorites(String id) async {
    final db = await database;

    List result = await db.query(
      'favorites',
      // Use a `where` clause to find a specific Type.
      where: 'imageId = ?',
      // Pass the id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
    if (result.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }
}
