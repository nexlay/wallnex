import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/domain/entities/wallpaper.dart';
import 'package:wallnex/domain/repository/wallpaper_repo.dart';

class GetWallpaperUseCase implements UseCase<List<Wallpaper>, NoParams>{
  final WallpaperRepo wallpaperRepo;
  GetWallpaperUseCase({required this.wallpaperRepo});


  @override
  Future<Either<Failure, List<Wallpaper>>> call (NoParams noParams) async{
    return await wallpaperRepo.getWallpapers();
  }
}