import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../repository/wallpaper_repo.dart';


class SetImageAsWallpaperUseCase extends UseCase<void, ParamsIntAndString> {
  final WallpaperRepo wallpaperRepo;

  SetImageAsWallpaperUseCase({required this.wallpaperRepo});
  @override
  Future<Either<Failure, bool>> call(ParamsIntAndString params) async {
    return await wallpaperRepo.setImageAsWallpaper(params.st, params.number);
  }

}