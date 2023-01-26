import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';

abstract class WallpaperRepo {

  ///Set image as wallpaper
  Future<Either<Failure, bool>> setImageAsWallpaper(String path, int screen);


}