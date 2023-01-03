import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';

import '../../features/customization/domain/usecase/get_nav_bar_usecase.dart';


class GetCustomization extends ChangeNotifier {
  final GetNavBarUseCase getNavBarUseCase;

  GetCustomization({required this.getNavBarUseCase});

  bool switchToCustomNavBar = false;
  String error = '';
  bool loading = false;

  Future<void> getNavBarStyle() async {
    loading = true;
    notifyListeners();
    final switcher = await getNavBarUseCase.get();
    switcher.fold((failure) => error = failure.toString(),
        (currentSwitcher) => switchToCustomNavBar = currentSwitcher);
    loading = false;
    notifyListeners();
  }

  Future<void> setNavBarStyle(bool currentSwitcher) async {
    loading = true;
    notifyListeners();
    await getNavBarUseCase
        .call(ParamsFour(params: currentSwitcher))
        .whenComplete(() {
      switchToCustomNavBar = currentSwitcher;
      loading = false;
      notifyListeners();
    });
  }
}
