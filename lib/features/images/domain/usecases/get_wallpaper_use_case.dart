import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../entities/wallpaper.dart';
import '../repository/wallpaper_repo.dart';

class GetWallpaperUseCase implements UseCase<List<Wallpaper>, ParamsTwo> {
  final WallpaperRepo wallpaperRepo;
  GetWallpaperUseCase({required this.wallpaperRepo});

  @override
  Future<Either<Failure, List<Wallpaper>>> call(ParamsTwo params) async {
    return await wallpaperRepo.getWallpapers(params.params, params.param);
  }
}
