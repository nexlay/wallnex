import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/exceptions/exceptions.dart';
import '../../domain/repository/image_repo.dart';
import '../datasource/database.dart';
import '../models/wallpaper_model.dart';

class ImageRepoImpl implements ImageRepo {
  final ImageDatabase imageDatabase;
  ImageRepoImpl({required this.imageDatabase});

  @override
  Future<Either<Failure, Iterable<WallpaperModel>>> getWallpapers(
      String url, int page) async {
    try {
      final localWallpaper = await imageDatabase.getImagesFromApi(page, url);
      return Right(localWallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }

  @override
  Future<Either<Failure, WallpaperModel>> getTagsAndUploader(String id) async {
    try {
      final localWallpaper = await imageDatabase.getTagsAndUploader(id);
      return Right(localWallpaper);
    } on LocalExceptions {
      return Left(LocalFailure());
    }
  }


}
