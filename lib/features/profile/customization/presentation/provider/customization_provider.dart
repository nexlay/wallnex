import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/get_nav_bar_usecase.dart';
import '../../domain/usecase/set_custom_nav_bar_use_case.dart';

class CustomizationProvider extends ValueNotifier<bool> {
  final GetNavBarUseCase _getNavBarUseCase;
  final SetNavBarUseCase _setNavBarUseCase;

  CustomizationProvider(this._getNavBarUseCase, this._setNavBarUseCase)
      : super(false);

  String error = '';
  bool loading = false;

  Future<void> getNavBarStyle() async {
    loading = true;
    notifyListeners();
    final switcher = await _getNavBarUseCase.call(NoParams());
    switcher.fold((failure) => error = failure.toString(),
        (currentSwitcher) => value = currentSwitcher);
    loading = false;
    notifyListeners();
  }

  Future<void> setNavBarStyle(bool currentSwitcher) async {
    loading = true;
    notifyListeners();
    await _setNavBarUseCase
        .call(ParamsBool(params: currentSwitcher))
        .whenComplete(() {
      value = currentSwitcher;
      loading = false;
      notifyListeners();
    });
  }
}
