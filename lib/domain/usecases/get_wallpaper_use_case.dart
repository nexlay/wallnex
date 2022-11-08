import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/domain/repository/wallpaper_repo.dart';

class GetWallpaperUseCase{
  final WallpaperRepo wallpaperRepo;
  GetWallpaperUseCase({required this.wallpaperRepo});


  Future<Either<Failure, List<Wallpaper>>> call () async{
    return await wallpaperRepo.getWallpapers();
  }
}