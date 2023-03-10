import 'package:flutter/cupertino.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../images/domain/entities/wallpaper.dart';
import '../../domain/usecase/get_suggestions_usecase.dart';



class GetSuggestionsNotifier extends ChangeNotifier {
  final GetSuggestionsUseCase getSuggestionsUseCase;

  GetSuggestionsNotifier({required this.getSuggestionsUseCase});

  List<Wallpaper> suggestions = [];
  bool isLoading = true;
  String error = '';

  Future<void> getSuggestions(
      String id) async {
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
}
