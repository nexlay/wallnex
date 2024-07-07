import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/profile/customization/domain/usecase/get_language_use_case.dart';
import 'package:wallnex/features/profile/customization/domain/usecase/set_language_use_case.dart';

// This enum will manage the overall language state of the app
enum AppLanguage {
  english(value: 'en'),
  polish(value: 'pl'),
  ukraine(value: 'uk');

  final String value;
  const AppLanguage({required this.value});
}

class LanguageProvider extends ValueNotifier<Locale> {
  final GetLanguageUseCase _getLanguageUseCase;
  final SetLanguageUseCase _setLanguageUseCase;

  LanguageProvider(this._getLanguageUseCase, this._setLanguageUseCase)
      //Default app language
      : super(
          Locale(AppLanguage.english.value),
        );

  String error = '';

  Future<void> getLanguageValue() async {
    final themeValue = await _getLanguageUseCase.call(NoParams());
    themeValue.fold(
      (l) {
        error = 'Fail';
      },
      (r) {
        _checkLanguage(r);
      },
    );
  }

  Future<void> setLanguageValue(String locale) async {
    await _setLanguageUseCase.call(ParamsString(params: locale)).whenComplete(
      () {
        _checkLanguage(locale);
      },
    );
  }

  void _checkLanguage(String locale) {
    switch (locale) {
      case 'en':
        value = Locale(AppLanguage.english.value);
        break;
      case 'pl':
        value = Locale(AppLanguage.polish.value);
        break;
      case 'uk':
        value = Locale(AppLanguage.ukraine.value);
        break;
    }
    notifyListeners();
  }
}
