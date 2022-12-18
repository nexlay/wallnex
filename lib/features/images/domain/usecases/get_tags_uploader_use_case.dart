import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../../../../core/errors/failure.dart';
import '../entities/wallpaper.dart';
import '../repository/wallpaper_repo.dart';

class GetTagsAndUploaderUseCase implements UseCase<Wallpaper, ParamsThree> {
  final WallpaperRepo wallpaperRepo;
  GetTagsAndUploaderUseCase({required this.wallpaperRepo});

  @override
  Future<Either<Failure, Wallpaper>> call(ParamsThree params) async {
    return await wallpaperRepo.getTagsAndUploader(params.params);
  }
}
