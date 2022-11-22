import 'package:dartz/dartz.dart';
import 'package:wallnex/data/models/wallpaper_model.dart';
import '../../core/errors/failure.dart';
import '../../core/exceptions/exceptions.dart';
import '../../domain/repository/wallpaper_repo.dart';
import '../datasource/local_data_source.dart';

class WallpaperRepoImpl implements WallpaperRepo {
  final LocalDataSource localDataSource;
  WallpaperRepoImpl({required this.localDataSource});

  @override
  Future<Either<Failure, List<WallpaperModel>>> getWallpapers() async {
    try {
      final localWallpaper = await localDataSource.getLocalWallpapers();
      return Right(localWallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }



  @override
  Future<Either<Failure, void>> setImageAsWallpaper(String path) async{
    try{
      final wallpaper = await localDataSource.setImageAsWallpaper(path);
      return Right(wallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }
}
