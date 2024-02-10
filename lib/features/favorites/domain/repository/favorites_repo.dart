import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../images/domain/entities/wallpaper.dart';

abstract class FavoritesRepo {


  ///Favorites in local Hive DB
  Future<Either<Failure, void>> addToFavorite(Wallpaper wallpaper);
  Future<Either<Failure, void>> deleteFromFavorite(String id);

  ///Favorites in FireStore
  Future<Either<Failure, void>> addToFireStore(Wallpaper wallpaper);
  Future<Either<Failure, void>> deleteFromFireStore(String id);

  ///Get favorites
  Future<Either<Failure, List<Wallpaper>>> getFavorites();
}
