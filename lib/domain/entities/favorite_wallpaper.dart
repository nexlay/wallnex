import 'package:wallnex/domain/entities/wallpaper.dart';

class FavoriteWallpaper extends Wallpaper {
  const FavoriteWallpaper(
      {required super.path,
      required super.id,
      required super.category,
      required super.name,
      required super.size,
      required super.downloads,
      required super.resolution,
      required super.colors,
      });
}
