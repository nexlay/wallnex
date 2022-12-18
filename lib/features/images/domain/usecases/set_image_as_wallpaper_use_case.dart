import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/repository/wallpaper_repo.dart';

class SetImageAsWallpaperUseCase extends UseCase<void, ParamsTwo> {
  final WallpaperRepo wallpaperRepo;

  SetImageAsWallpaperUseCase({required this.wallpaperRepo});
  @override
  Future<Either<Failure, bool>> call(ParamsTwo params) async {
    return wallpaperRepo.setImageAsWallpaper(params.params, params.param);
  }

}