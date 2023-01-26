import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../entities/wallpaper.dart';
import '../repository/image_repo.dart';


class GetImageUseCase implements UseCase<Iterable<Wallpaper>, ParamsIntAndString> {
  final ImageRepo imageRepo;
  GetImageUseCase({required this.imageRepo});

  @override
  Future<Either<Failure, Iterable<Wallpaper>>> call(ParamsIntAndString params) async {
    return await imageRepo.getWallpapers(params.st, params.number);
  }
}
