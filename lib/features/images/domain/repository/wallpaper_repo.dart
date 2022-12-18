import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wallpaper.dart';

abstract class WallpaperRepo {
  ///Get images from wallhaven api
  Future<Either<Failure, List<Wallpaper>>> getWallpapers(String url, int page);
  Future<Either<Failure, Wallpaper>> getTagsAndUploader(String id);

  ///Add image to the favorites
  Future <Either<Failure, void>> addToFavorite (Wallpaper wallpaper);
  Future <Either<Failure, void>> updateFavorite (Wallpaper wallpaper);
  Future <Either<Failure, void>> deleteFromFavorite (String id);
  Future <Either<Failure, List<Wallpaper>>> getFavoriteWallpapers ();
  Future<Either<Failure, bool>> checkFavorite (String id);

  ///Get suggestion
  Future<Either<Failure, List<Wallpaper>>> getSuggestions(String id);

  ///Set image as wallpaper
  Future<Either<Failure, bool>> setImageAsWallpaper(String path, int screen);
}
