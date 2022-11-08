import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/domain/repository/wallpaper_repo.dart';

class SetImageAsWallpaper implements UseCase<void, Params>{
  final WallpaperRepo wallpaperRepo;
  SetImageAsWallpaper({required this.wallpaperRepo});

  @override
  Future<Either<Failure, void>> call(Params params) async{
    return await wallpaperRepo.setImageAsWallpaper(params.path);
  }

}
class Params extends Equatable {
  final String path;
  const Params({required this.path});

  @override
  List<Object?> get props => [path];

}