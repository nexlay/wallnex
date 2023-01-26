import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wallpaper.dart';

abstract class ImageRepo {
  ///Get images from wallhaven api
  Future<Either<Failure, Iterable<Wallpaper>>> getWallpapers(String url, int page);
  Future<Either<Failure, Wallpaper>> getTagsAndUploader(String id);
}
