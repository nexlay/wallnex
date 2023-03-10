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
      : super(ThemeValue.dark);

  String error = '';
  bool themeModeDark = true;
  var brightness = WidgetsBinding.instance.window.platformBrightness;

  Future<void> getThemeValue() async {
    final themeValue = await _getThemeUseCase.call(NoParams());
    themeValue.fold(
      (l) {
        error = 'Fail';
      },
      (r) {
        checkThemeMode(r);
      },
    );
  }

  Future<void> setThemeValue(int index) async {
    await _setThemeUseCase.call(ParamsWithInt(params: index)).whenComplete(
      () {
        checkThemeMode(index);
      },
    );
  }

  void checkThemeMode(int index) {
    bool isDarkMode = brightness == Brightness.dark;
    switch (index) {
      case 0:
        value = ThemeValue.auto;
        themeModeDark = isDarkMode;
        break;
      case 1:
        value = ThemeValue.light;
        themeModeDark = false;
        break;
      case 2:
        value = ThemeValue.dark;
        themeModeDark = true;
        break;
    }
    notifyListeners();
  }
}
