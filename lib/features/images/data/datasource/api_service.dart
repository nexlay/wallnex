import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:flutter_wallpaper_manager/flutter_wallpaper_manager.dart';
import 'package:hive/hive.dart';
import 'package:wallnex/const.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

abstract class ApiDataSource {
  Future<List<WallpaperModel>> getImagesFromApi(int page, String url);
  Future<WallpaperModel> getTagsAndUploader(String id);

  Future<List<WallpaperModel>> getFavoriteWallpapers();
  Future<void> updateFavorite(Wallpaper wallpaper);
  Future<void> addToFavorite(Wallpaper wallpaper);
  Future<void> deleteFromFavorite(String id);
  Future<bool> checkFavorites(String id);

  Future<List<WallpaperModel>> getSuggestions(String id);

  Future<bool> setImageAsWallpaper(String path, int screen);
}

class ApiDataSourceImpl extends ApiDataSource {
  @override
  Future<List<WallpaperModel>> getImagesFromApi(int page, String url) async {
    final response = await http.get(
      Uri.parse(
        url + page.toString(),
      ),
    );
    if (response.statusCode == 200) {
      final data = await json.decode(response.body);
      List items = data["data"];
      return Future.value(
        items
            .map(
              (e) => WallpaperModel.fromJson(e),
            )
            .toList(),
      );
    } else {
      throw Exception(
          'Failed to load images. Status code: ${response.statusCode}');
    }
  }

  @override
  Future<WallpaperModel> getTagsAndUploader(String id) async {
    final response = await http.get(Uri.parse(imageUrl + id));
    if (response.statusCode == 200) {
      final data = await json.decode(response.body);

      return WallpaperModel.fromJson(data['data']);
    } else {
      throw Exception(
          'Failed to load images. Status code: ${response.statusCode}');
    }
  }

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
  Future<List<WallpaperModel>> getFavoriteWallpapers() async {
    // get the previously opened box
    final favoriteBox = Hive.box<Wallpaper>('favorites');
    final list = favoriteBox.values;

    return Future.value(
        list.map((e) => WallpaperModel.fromIterable(e)).toList());
  }

  @override
  Future<bool> checkFavorites(String id) async {
    // get the previously opened box
    final favoriteBox = Hive.box<Wallpaper>('favorites');
    final result = favoriteBox.values.toList();
    var contain = result.where((element) => element.toString().contains(id));

    if (contain.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<List<WallpaperModel>> getSuggestions(String id) async {
    final response = await http.get(
      Uri.parse('https://wallhaven.cc/api/v1/search?q=like:$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List items = data['data'];

      for (var e in items) {
        if (e.toString().contains(id)) {
          items.remove(e);
          break;
        }
      }

      return Future.value(
        items
            .map(
              (e) => WallpaperModel.fromJson(e),
            )
            .toList(),
      );
    } else {
      throw Exception(
          'Failed to load images. Status code: ${response.statusCode}');
    }
  }

  @override
  Future<bool> setImageAsWallpaper(String path, int screen) async {
    // WallpaperManager.HOME_SCREEN = 1;
    // WallpaperManager.LOCK_SCREEN = 2;
    // WallpaperManager.BOTH_SCREEN = 3;

    try {
      return await WallpaperManager.setWallpaperFromFile(path, screen);
    } on PlatformException {
      'Failed to set Wallpaper.';
      return false;
    }
  }
}
