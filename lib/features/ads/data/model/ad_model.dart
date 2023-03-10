import 'package:google_mobile_ads/google_mobile_ads.dart';
import '../../domain/entities/ad.dart';

class BannerAdModel extends BannerAD {
  const BannerAdModel({
    required super.listener,
    required super.adUnitId,
    required super.size,
    required super.request,
    required super.adStatus,
  });

  factory BannerAdModel.createBanner({
    required AdManagerBannerAdListener listener,
    required String? adUnitId,
    required AdSize? size,
    required AdRequest request,
    required bool adStatus,
  }) {
    return BannerAdModel(
      listener: listener,
      adUnitId: adUnitId,
      size: size,
      request: request,
      adStatus: adStatus,
    );
  }
}
