import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/ads/domain/usecase/create_banner_ad_use_case.dart';
import '../../domain/entities/ad.dart';

class AdProvider extends ChangeNotifier {
  final CreateBannerAdUseCase _createBannerAdUseCase;

  BannerAD bannerAD = BannerAD.initialState();


  static String error = '';

  AdProvider(this._createBannerAdUseCase);

  Future<void> createBanner() async {
    final result = await _createBannerAdUseCase.call(NoParams());

    result.fold((l) => error = l.toString(), (r) {
      bannerAD = r;
      notifyListeners();
    });
  }
}
