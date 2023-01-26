import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../images/domain/entities/wallpaper.dart';

abstract class FavoritesRepo {
  ///Add image to the favorites
  Future <Either<Failure, void>> addToFavorite (Wallpaper wallpaper);
  Future <Either<Failure, void>> updateFavorite (Wallpaper wallpaper);
  Future <Either<Failure, void>> deleteFromFavorite (String id);
  Future <Either<Failure, Iterable<Wallpaper>>> getFavoriteWallpapers ();
  Future<Either<Failure, bool>> checkFavorite (String id);

}