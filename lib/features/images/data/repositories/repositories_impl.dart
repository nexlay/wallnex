import 'package:dartz/dartz.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/repository/wallpaper_repo.dart';
import '../datasource/api_service.dart';
import '../models/wallpaper_model.dart';

class WallpaperRepoImpl implements WallpaperRepo {
  final ApiDataSource wallhavenApi;
  WallpaperRepoImpl({required this.wallhavenApi});

  @override
  Future<Either<Failure, List<WallpaperModel>>> getWallpapers(
      String url, int page) async {
    try {
      final localWallpaper = await wallhavenApi.getImagesFromApi(page, url);
      return Right(localWallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, WallpaperModel>> getTagsAndUploader(String id) async {
    try {
      final localWallpaper = await wallhavenApi.getTagsAndUploader(id);
      return Right(localWallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, void>> addToFavorite(Wallpaper wallpaper) async {
    try {
      final favorite = await wallhavenApi.addToFavorite(wallpaper);
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
      final deleteFavorite = await wallhavenApi.deleteFromFavorite(id);
      return Right(deleteFavorite);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> getFavoriteWallpapers() async {
    try {
      final favoritesList = await wallhavenApi.getFavoriteWallpapers();
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
      final updateFavorite = await wallhavenApi.updateFavorite(wallpaper);
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
      final isFavorite = await wallhavenApi.checkFavorites(id);
      return Right(isFavorite);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, List<WallpaperModel>>> getSuggestions(
      String id) async {
    try {
      final result = await wallhavenApi.getSuggestions(id);
      return Right(result);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, bool>> setImageAsWallpaper(
      String path, int screen) async {
    try {
      final wallpaper = await wallhavenApi.setImageAsWallpaper(path, screen);
      return Right(wallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
