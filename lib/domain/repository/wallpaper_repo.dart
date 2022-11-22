import 'package:dartz/dartz.dart';
import '../../core/errors/failure.dart';
import '../entities/wallpaper.dart';


abstract class WallpaperRepo {
Future <Either<Failure, List<Wallpaper>>> getWallpapers ();

Future <Either<Failure, void>> setImageAsWallpaper (String path);
}