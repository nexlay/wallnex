import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/images/domain/repository/wallpaper_repo.dart';

import '../entities/wallpaper.dart';

class GetSuggestionsUseCase implements UseCase<List<Wallpaper>, ParamsThree> {
  final WallpaperRepo wallpaperRepo;

  GetSuggestionsUseCase({required this.wallpaperRepo});

  @override
  Future<Either<Failure, List<Wallpaper>>> call(ParamsThree params) async {
   return await wallpaperRepo.getSuggestions(params.params);
  }

}