import 'package:wallnex/domain/entities/favorite_wallpaper.dart';

class FavoriteWallpapersModel extends FavoriteWallpaper {
  const FavoriteWallpapersModel(
      {required super.path,
      required super.id,
      required super.category,
      required super.name,
      required super.size,
      required super.downloads,
      required super.resolution,
      required super.colors,
      });

  factory FavoriteWallpapersModel.fromJson(Map<String, dynamic> fromJson) {
    return FavoriteWallpapersModel(
      path: fromJson['path'],
      id: fromJson['imageId'],
      category: fromJson['category'],
      name: fromJson['name'],
      size: fromJson['size'],
      downloads: fromJson['downloads'],
      resolution: fromJson['resolution'],
      colors: fromJson['colors'].split(',').toList(),
    );
  }
}
