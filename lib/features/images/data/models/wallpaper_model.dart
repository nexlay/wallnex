import '../../domain/entities/wallpaper.dart';

class WallpaperModel extends Wallpaper {
  const WallpaperModel({
    required super.path,
    required super.id,
    required super.category,
    required super.size,
    required super.views,
    required super.resolution,
    required super.colors,
    required super.shortUrl,
    required super.fileType,
    required super.name,
    required super.uploaderName,
    required super.thumbsLarge,
  });

  factory WallpaperModel.fromJson(
    Map<String, dynamic> map,
  ) {
    return WallpaperModel(
      path: map['path'] ?? '',
      id: map['id'] ?? '',
      category: map['category'] ?? '',
      size: map['file_size'] ?? 0,
      views: map['views'] ?? 0,
      resolution: map['resolution'] ?? '',
      colors: map['colors'] ?? [],
      shortUrl: map['short_url'] ?? '',
      fileType: map['file_type'] ?? '',
      name: map['tags']?[0]?['name'] ?? '',
      uploaderName: map['uploader']?['username'] ?? '',
      thumbsLarge: map['thumbs']['large'] ?? '',
    );
  }

  factory WallpaperModel.fromIterable(Wallpaper wallpaper) {
    return WallpaperModel(
      path: wallpaper.path,
      id: wallpaper.id,
      category: wallpaper.category,
      size: wallpaper.size,
      views: wallpaper.views,
      resolution: wallpaper.resolution,
      colors: wallpaper.colors,
      shortUrl: wallpaper.shortUrl,
      fileType: wallpaper.fileType,
      name: wallpaper.name,
      uploaderName: wallpaper.uploaderName,
      thumbsLarge: wallpaper.thumbsLarge,
    );
  }
}
