import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/favorites/data/data/favorites_database.dart';
import 'package:wallnex/features/favorites/domain/repository/favorites_repo.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../../images/data/models/wallpaper_model.dart';

class FavoritesRepoImpl implements FavoritesRepo{
  final FavoritesDatabase favoritesDatabase;

  FavoritesRepoImpl({required this.favoritesDatabase});
  @override
  Future<Either<Failure, void>> addToFavorite(Wallpaper wallpaper) async {
    try {
      final favorite = await favoritesDatabase.addToFavorite(wallpaper);
      return Right(favorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> deleteFromFavorite(String id) async {
    try {
      final deleteFavorite = await favoritesDatabase.deleteFromFavorite(id);
      return Right(deleteFavorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, Iterable<WallpaperModel>>> getFavoriteWallpapers() async {
    try {
      final favoritesList = await favoritesDatabase.getFavorites();
      return Right(favoritesList);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> updateFavorite(Wallpaper wallpaper) async {
    try {
      final updateFavorite = await favoritesDatabase.updateFavorite(wallpaper);
      return Right(updateFavorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkFavorite(String id) async {
    try {
      final isFavorite = await favoritesDatabase.checkFavorites(id);
      return Right(isFavorite);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

}