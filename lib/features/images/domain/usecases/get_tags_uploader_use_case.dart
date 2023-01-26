import 'package:dartz/dartz.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../core/errors/failure.dart';
import '../entities/wallpaper.dart';
import '../repository/image_repo.dart';


class GetTagsAndUploaderUseCase implements UseCase<Wallpaper, ParamsString> {
  final ImageRepo imageRepo;
  GetTagsAndUploaderUseCase({required this.imageRepo});

  @override
  Future<Either<Failure, Wallpaper>> call(ParamsString params) async {
    return await imageRepo.getTagsAndUploader(params.st);
  }
}
