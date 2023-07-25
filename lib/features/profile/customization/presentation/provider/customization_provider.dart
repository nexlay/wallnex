import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/get_crossAxisCount_usecase.dart';
import '../../domain/usecase/get_nav_bar_usecase.dart';
import '../../domain/usecase/set_crossAxisCount_usecase.dart';
import '../../domain/usecase/set_custom_nav_bar_use_case.dart';

enum CrossAxis {
  small(value: 3),
  big(value: 2);

  final int value;

  const CrossAxis({required this.value});
}

class CustomizationProvider extends ChangeNotifier {
  final GetNavBarUseCase _getNavBarUseCase;
  final SetNavBarUseCase _setNavBarUseCase;
  final GetCrossAxisCount _getCrossAxisCount;
  final SetCrossAxisCount _setCrossAxisCount;

  CustomizationProvider(this._getNavBarUseCase, this._setNavBarUseCase,
      this._getCrossAxisCount, this._setCrossAxisCount);

  String error = '';
  bool loading = false;
  bool customNavBar = false;
  bool crossAxisCount = false;

  Future<void> getNavBarStyle() async {
    loading = true;
    notifyListeners();
    final switcher = await _getNavBarUseCase.call(NoParams());
    switcher.fold((failure) => error = failure.toString(),
        (currentSwitcher) => customNavBar = currentSwitcher);
    loading = false;
    notifyListeners();
  }

  Future<void> setNavBarStyle(bool currentSwitcher) async {
    loading = true;
    notifyListeners();
    await _setNavBarUseCase
        .call(ParamsBool(params: currentSwitcher))
        .whenComplete(() {
      customNavBar = currentSwitcher;
      loading = false;
      notifyListeners();
    });
  }

  Future<void> getCrossAxisCount() async {
    loading = true;
    notifyListeners();
    final switcher = await _getCrossAxisCount.call(NoParams());
    switcher.fold((failure) => error = failure.toString(),
        (currentSwitcher) => crossAxisCount = currentSwitcher);
    loading = false;
    notifyListeners();
  }

  Future<void> setCrossAxisCount(bool currentSwitcher) async {
    loading = true;
    notifyListeners();
    await _setCrossAxisCount
        .call(ParamsBool(params: currentSwitcher))
        .whenComplete(() {
      crossAxisCount = currentSwitcher;
      loading = false;
      notifyListeners();
    });
  }
}
