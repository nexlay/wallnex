import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../domain/usecase/get_theme_usecase.dart';
import '../../domain/usecase/set_theme_usecase.dart';

// This enum will manage the overall theme state of the app
enum ThemeValue {
  auto(value: 0),
  light(value: 1),
  dark(value: 2);

  final int value;
  const ThemeValue({required this.value});
}

class ThemeProvider extends ValueNotifier<ThemeValue> {
  final GetThemeUseCase _getThemeUseCase;
  final SetThemeUseCase _setThemeUseCase;

  ThemeProvider(this._getThemeUseCase, this._setThemeUseCase)
      //Default app theme
      : super(ThemeValue.dark);

  String error = '';


  Future<void> getThemeValue() async {
    final themeValue = await _getThemeUseCase.call(NoParams());
    themeValue.fold(
      (l) {
        error = 'Fail';
      },
      (r) {
        _checkThemeMode(r);
      },
    );
  }

  Future<void> setThemeValue(int index) async {
    await _setThemeUseCase.call(ParamsWithInt(params: index)).whenComplete(
      () {
        _checkThemeMode(index);
      },
    );
  }

  void _checkThemeMode(int index) {
    switch (index) {
      case 0:
        value = ThemeValue.auto;
        break;
      case 1:
        value = ThemeValue.light;
        break;
      case 2:
        value = ThemeValue.dark;
        break;
    }
    notifyListeners();
  }


}
