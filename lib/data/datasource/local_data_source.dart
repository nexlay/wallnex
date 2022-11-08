import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:wallnex/const.dart';
import '../models/wallpaper_model.dart';

abstract class LocalDataSource {
  Future<List<WallpaperModel>> getLocalWallpapers();

  Future<void> setImageAsWallpaper (String path);
}

class LocalDataSourceImpl extends LocalDataSource {


  @override
 Future<List<WallpaperModel>> getLocalWallpapers() async {
    final jsonDataList = await rootBundle.loadString(jsonPath);
    final data = json.decode(jsonDataList);
    List items = data["wallpapers"];
    return Future.value(items.map((e) => WallpaperModel.fromJson(e)).toList());
  }
 //TODO: SET image as wallpaper
  @override
  Future<void> setImageAsWallpaper(String path) async {
  }
}
