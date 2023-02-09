import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repository/favorites_repo.dart';


class AddDeleteUpdateUseCase {
  final FavoritesRepo favoriteWallpaperRepo;

  AddDeleteUpdateUseCase({required this.favoriteWallpaperRepo});



  //add into Database
  Future<Either<Failure, void>> addFavoriteWallpaper(ParamsImage params) async {
    return await favoriteWallpaperRepo.addToFavorite(params.wallpaper);
  }



  //Delete from Database
  Future<Either<Failure, void>> deleteFromFavorite(ParamsImage params) async {
    return await favoriteWallpaperRepo.deleteFromFavorite(params.wallpaper.id);
  }

  //Check if image is favor
  Future<Either<Failure, bool>> checkFavorites(ParamsImage params) async {
    return await favoriteWallpaperRepo.checkFavorite(params.wallpaper.id);
  }
}
