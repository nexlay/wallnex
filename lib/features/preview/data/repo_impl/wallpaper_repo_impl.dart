import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/repository/wallpaper_repo.dart';
import '../data/data.dart';



class WallpaperRepoImpl implements WallpaperRepo {
  final SetImageAsWallpaper wallpaperDatabase;

  WallpaperRepoImpl({required this.wallpaperDatabase});

  @override
  Future<Either<Failure, bool>> setImageAsWallpaper(
      String path, int screen) async {
    try {
      final wallpaper = await wallpaperDatabase.setWallpaper(path, screen);
      return Right(wallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
