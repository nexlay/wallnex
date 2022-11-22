import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/domain/repository/wallpaper_repo.dart';

class SetImageAsWallpaper implements UseCase<void, Params>{
  final WallpaperRepo wallpaperRepo;
  SetImageAsWallpaper({required this.wallpaperRepo});

  @override
  Future<Either<Failure, void>> call(Params params) {
    // TODO: implement call
    throw UnimplementedError();
  }

}
