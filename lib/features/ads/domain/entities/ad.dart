import 'package:equatable/equatable.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class BannerAD extends Equatable {
  final BannerAdListener? listener;
  final String? adUnitId;
  final AdSize? size;
  final AdRequest? request;
  final bool adStatus;

  const BannerAD({
    required this.listener,
    required this.adUnitId,
    required this.size,
    required this.request,
    required this.adStatus,
  });

  factory BannerAD.initialState() => const BannerAD(
      listener: null,
      adUnitId: null,
      size: null,
      request: null,
      adStatus: false);
  @override
  List<Object?> get props => [];
}
