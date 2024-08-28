import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:wallnex/features/ads/presentation/provider/ad_provider.dart';
import '../../../../const/const.dart';
import '../../../subscription/presentation/provider/purchase_provider.dart';

class BannerAdWidget extends StatefulWidget {
  const BannerAdWidget({super.key});

  @override
  State<BannerAdWidget> createState() => _BannerAdWidgetState();
}

class _BannerAdWidgetState extends State<BannerAdWidget> {
  BannerAd? _bannerAd;

  @override
  void didChangeDependencies() {
    final provider = context.watch<AdProvider>();

    if (provider.bannerAD.adUnitId != null) {
      setState(() {
        _bannerAd = BannerAd(
            size: provider.bannerAD.size!,
            adUnitId: provider.bannerAD.adUnitId!,
            listener: provider.bannerAD.listener!,
            request: provider.bannerAD.request!)
          ..load();
      });
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bannerAd?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<AdProvider>();
    final purchaseResult =
        context.select((PurchaseProvider provider) => provider.purchaseResult);
    return purchaseResult == false && _bannerAd != null
        ? SliverToBoxAdapter(
            child: SizedBox(
              width: provider.bannerAD.size!.width.toDouble(),
              height: provider.bannerAD.size!.height.toDouble(),
              child: Card(
                color: Theme.of(context).colorScheme.background,
                elevation: kDefaultValue,
                clipBehavior: Clip.antiAliasWithSaveLayer,
                child: AdWidget(
                  ad: _bannerAd!,
                ),
              ),
            ),
          )
        : const SliverToBoxAdapter();
  }
}
