import 'package:flutter/cupertino.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:wallnex/core/config/env/env.dart';
import '../model/ad_model.dart';

abstract class BannerAdDatasource {
  Future<BannerAdModel> getBannerAd();
}

class BannerAdDataSourceImpl implements BannerAdDatasource {


  @override
  Future<BannerAdModel> getBannerAd() async {
    return Future.value(
      BannerAdModel.createBanner(
        listener: _listener,
        adUnitId: _bannerUid,
        size: _size,
        request: _adRequest,
        adStatus: _adStatus(),
      ),
    );
  }

  String? get _bannerUid => Env.bannerId;

  AdManagerBannerAdListener get _listener => _adListener;

  AdSize get _size => AdSize.banner;

  AdRequest get _adRequest => const AdRequest();

  bool _adStatus() => true;

 final AdManagerBannerAdListener _adListener = AdManagerBannerAdListener(
    // Called when an ad is successfully received.
    onAdLoaded: (Ad ad) {
      debugPrint('Ad loaded.');
    },
    // Called when an ad request failed.
    onAdFailedToLoad: (Ad ad, LoadAdError error) {
      // Dispose the ad here to free resources.
      ad.dispose();
      debugPrint('Ad failed to load: $error');
    },
    // Called when an ad opens an overlay that covers the screen.
    onAdOpened: (Ad ad) => debugPrint('Ad opened.'),
    // Called when an ad removes an overlay that covers the screen.
    onAdClosed: (Ad ad) => debugPrint('Ad closed.'),
    // Called when an impression occurs on the ad.
    onAdImpression: (Ad ad) => debugPrint('Ad impression.'),
    onAppEvent: (ad, name, data) =>
        debugPrint('App event : ${ad.adUnitId}, $name, $data.'),
  );
}
