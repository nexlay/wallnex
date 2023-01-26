import 'package:flutter/cupertino.dart';
import '../../domain/usecase/get_theme_usecase.dart';
// This enum will manage the overall theme state of the app
enum ThemeValue {
  auto(value: 0),
  light(value: 1),
  dark(value: 2);

  final int value;
  const ThemeValue({required this.value});
}

class GetThemeNotifier extends ValueNotifier<ThemeValue> {
  final GetThemeUseCase getThemeUseCase;
  GetThemeNotifier({required this.getThemeUseCase}) : super(ThemeValue.dark);

  String error = '';
  bool themeModeDark = true;
  var brightness = WidgetsBinding.instance.window.platformBrightness;

  Future<void> getThemeValue() async {
    final themeValue = await getThemeUseCase.getTheme();
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
    await getThemeUseCase.setTheme(index).whenComplete(
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
