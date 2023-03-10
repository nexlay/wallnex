import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../entities/ad.dart';
import '../repo/repository.dart';

class CreateBannerAdUseCase extends UseCase<BannerAD, NoParams> {
  final AdRepo adRepo;

  CreateBannerAdUseCase({required this.adRepo});
  @override
  Future<Either<Failure, BannerAD>> call(NoParams params) async {
    return await adRepo.createBannerAd();
  }
}
