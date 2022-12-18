import 'package:flutter/cupertino.dart';
import 'package:wallnex/features/theme/domain/usecase/get_theme_usecase.dart';

class GetThemeNotifier extends ChangeNotifier {
  final GetThemeUseCase getThemeUseCase;

  GetThemeNotifier({required this.getThemeUseCase});

  int value = 2;
  String error = '';
  late bool themeModeDark;

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
    notifyListeners();
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
