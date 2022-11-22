import 'package:dartz/dartz.dart';
import 'package:wallnex/domain/entities/favorite_wallpaper.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import '../../core/errors/failure.dart';

abstract class FavoriteWallpaperRepo {

  Future <Either<Failure, void>> openDatabase ();
  Future <Either<Failure, void>> addToFavorite (Wallpaper wallpaper);
  Future <Either<Failure, void>> updateFavorite (Wallpaper wallpaper);
  Future <Either<Failure, void>> deleteFromFavorite (String id);

  Future <Either<Failure, List<FavoriteWallpaper>>> getFavoriteWallpapers ();

  Future<Either<Failure, bool>> checkFavorite (String id);

}