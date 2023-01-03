import 'package:flutter/cupertino.dart';

import '../../features/customization/domain/usecase/get_theme_usecase.dart';


var brightness = WidgetsBinding.instance.window.platformBrightness;

class GetThemeNotifier extends ValueNotifier<int> {
  final GetThemeUseCase getThemeUseCase;

  GetThemeNotifier({required this.getThemeUseCase}) : super(2);

  String error = '';
  bool themeModeDark = true;

  Future<void> getThemeValue() async {
    final themeValue = await getThemeUseCase.getTheme();
    themeValue.fold(
      (l) {
        error = 'Fail';
      },
      (r) {
        value = r;
        notifyListeners();
      },
    );
  }

  Future<void> setThemeValue(int themeValue) async {
    await getThemeUseCase.setTheme(themeValue).whenComplete(
      () {
        value = themeValue;
        checkThemeMode();
        notifyListeners();
      },
    );
  }



  void checkThemeMode() {
    var brightness = WidgetsBinding.instance.window.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (value == 2) {
      themeModeDark = true;
    } else if (value == 1) {
      themeModeDark = false;
    } else if (value == 0 && isDarkMode) {
      themeModeDark = true;
    } else if (value == 0 && !isDarkMode) {
      themeModeDark = false;
    }
    notifyListeners();
  }
}
