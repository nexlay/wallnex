import 'package:flutter/cupertino.dart';
import 'package:wallnex/features/suggestions/domain/usecase/get_suggestions_by_color_usecase.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../../domain/usecase/get_suggestions_usecase.dart';

class GetSuggestionsNotifier extends ChangeNotifier {
  final GetSuggestionsUseCase getSuggestionsUseCase;
  final GetSuggestionsByColorUseCase getSuggestionsByColorUseCase;

  GetSuggestionsNotifier(
      {required this.getSuggestionsUseCase,
      required this.getSuggestionsByColorUseCase});

  List<Wallpaper> suggestions = [];
  bool isLoading = true;
  String error = '';

  Future<void> getSuggestions(String id) async {
    final result = await getSuggestionsUseCase.call(
      ParamsString(params: id),
    );

    result.fold((l) {
      error = 'Fail';
      isLoading = false;
    }, (iterable) {
      suggestions = iterable.toList();
      isLoading = false;
    });
    notifyListeners();
  }

  Future<void> getSuggestionsByColor(String color, String id) async {
    final result = await getSuggestionsByColorUseCase.call(
      ParamsMultiString(params: color, params1: id),
    );

    result.fold((l) {
      error = 'Fail';
      isLoading = false;
    }, (iterable) {
      suggestions = iterable.toList();
      isLoading = false;
    });
    notifyListeners();
  }
}
