import 'package:dartz/dartz.dart';
import 'package:wallnex/core/errors/failure.dart';
import 'package:wallnex/features/ads/data/datasource/datasource.dart';
import 'package:wallnex/features/ads/domain/entities/ad.dart';
import 'package:wallnex/features/ads/domain/repo/repository.dart';
import '../../../../core/exceptions/exceptions.dart';

class AdRepoImpl implements AdRepo {
  final BannerAdDatasource bannerAdDatasource;

  AdRepoImpl({required this.bannerAdDatasource});

  @override
  Future<Either<Failure, BannerAD>> createBannerAd() async {
    try {
      final banner = await bannerAdDatasource.getBannerAd();
      return Right(banner);
    } on LocalExceptions {
      return Left(
        LocalFailure(),
      );
    }
  }
}
