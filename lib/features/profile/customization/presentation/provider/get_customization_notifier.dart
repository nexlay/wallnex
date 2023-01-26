import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/get_nav_bar_usecase.dart';

class GetCustomization extends ValueNotifier<bool> {
  final GetNavBarUseCase getNavBarUseCase;

  GetCustomization({required this.getNavBarUseCase}) : super(false);

  String error = '';
  bool loading = false;


  Future<void> getNavBarStyle() async {
    loading = true;
    notifyListeners();
    final switcher = await getNavBarUseCase.get();
    switcher.fold((failure) => error = failure.toString(),
        (currentSwitcher) => value = currentSwitcher);
    loading = false;
    notifyListeners();
  }

  Future<void> setNavBarStyle(bool currentSwitcher) async {
    loading = true;
    notifyListeners();
    await getNavBarUseCase
        .call(ParamsBool(bl: currentSwitcher))
        .whenComplete(() {
      value = currentSwitcher;
      loading = false;
      notifyListeners();
    });
  }
}
