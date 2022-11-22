import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/exceptions/exceptions.dart';
import 'package:wallnex/data/datasource/sqlite_database.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/domain/repository/favorite_wallpaper_repo.dart';
import '../models/favorite_wallpapers_model.dart';

class FavoriteRepoImpl implements FavoriteWallpaperRepo {
  final LocalDatabase database;

  FavoriteRepoImpl({required this.database});

  @override
  Future<Either<Failure, void>> openDatabase() async {
    try {
      final db = await database.setUpDatabase();
      return Right(db);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorite(Wallpaper wallpaper) async {
    try {
      final favorite = await database.addToFavorite(wallpaper);
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
      final deleteFavorite = await database.deleteFromFavorite(id);
      return Right(deleteFavorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<FavoriteWallpapersModel>>>
      getFavoriteWallpapers() async {
    try {
      final favoritesList = await database.getFavoriteWallpapers();
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
      final updateFavorite = await database.updateFavorite(wallpaper);
      return Right(updateFavorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, bool>> checkFavorite(String id) async {
   try{
     final isFavorite = await database.checkFavorites(id);
     return Right(isFavorite);
   } on LocalExceptions {
     return Left(LocalFailure());
   }
  }
}
