import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/domain/repository/favorite_wallpaper_repo.dart';
import '../entities/favorite_wallpaper.dart';

class GetFavoriteWallpapers {
  final FavoriteWallpaperRepo favoriteWallpaperRepo;

  GetFavoriteWallpapers({required this.favoriteWallpaperRepo});

  Future<Either<Failure, List<FavoriteWallpaper>>> call(NoParams params) async {
    return await favoriteWallpaperRepo.getFavoriteWallpapers();
  }

  Future<Either<Failure,void>> openDatabase (NoParams params) async {
    return await favoriteWallpaperRepo.openDatabase();
  }

  //add into Database
  Future<Either<Failure, void>> addFavoriteWallpaper(Params params) async {
    return await favoriteWallpaperRepo.addToFavorite(params.wallpaper);
  }

  //Update Database
  Future<Either<Failure, void>> updateFavorite(Params params) async {
    return await favoriteWallpaperRepo.updateFavorite(params.wallpaper);
  }

  //Delete from Database
  Future<Either<Failure, void>> deleteFromFavorite(Params params) async {
    return await favoriteWallpaperRepo.deleteFromFavorite(params.wallpaper.id);
  }

  //Check if image is favor
  Future<Either<Failure, bool>> checkFavorites(Params params) async {
    return await favoriteWallpaperRepo.checkFavorite(params.wallpaper.id);
  }
}
