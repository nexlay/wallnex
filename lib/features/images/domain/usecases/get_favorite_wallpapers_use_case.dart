import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../repository/wallpaper_repo.dart';

class GetFavoriteWallpapersUseCase {
  final WallpaperRepo favoriteWallpaperRepo;

  GetFavoriteWallpapersUseCase({required this.favoriteWallpaperRepo});

  Future<Either<Failure, List<Wallpaper>>> call(NoParams params) async {
    return await favoriteWallpaperRepo.getFavoriteWallpapers();
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
