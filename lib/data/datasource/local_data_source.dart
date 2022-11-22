import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:wallnex/const.dart';
import '../models/app_info_model.dart';
import '../models/wallpaper_model.dart';

abstract class LocalDataSource {
  Future<List<WallpaperModel>> getLocalWallpapers();

  Future<void> setImageAsWallpaper(String path);

  Future<AppInfoModel> getAppInfoFromPackage();
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
  Future<void> setImageAsWallpaper(String path) async {}

  @override
  Future<AppInfoModel> getAppInfoFromPackage() async {
    PackageInfo packageInfo = await PackageInfo.fromPlatform();
    String appName = packageInfo.appName;
    String version = packageInfo.version;
    String buildNumber = packageInfo.buildNumber;
    return Future(
      () => AppInfoModel(
          appBuild: buildNumber, appName: appName, appVersion: version),
    );
  }
}
