import 'package:dartz/dartz.dart';
import '../../../../core/errors/failure.dart';
import '../entities/ad.dart';

abstract class AdRepo {
  Future<Either<Failure, BannerAD>> createBannerAd ();
}