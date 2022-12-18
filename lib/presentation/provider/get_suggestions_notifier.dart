import 'package:flutter/cupertino.dart';
import '../../core/usecase/usecase.dart';
import '../../features/images/domain/entities/wallpaper.dart';
import '../../features/images/domain/usecases/get_suggestions_usecase.dart';


class GetSuggestionsNotifier extends ChangeNotifier {
  final GetSuggestionsUseCase getSuggestionsUseCase;

  GetSuggestionsNotifier({required this.getSuggestionsUseCase});

  List<Wallpaper> suggestions = [];
  bool isLoading = true;
  String error = '';

  Future<void> getSuggestions(
      String id, String colors) async {
    final result = await getSuggestionsUseCase.call(
      ParamsThree(params: id,),
    );

    result.fold((l) {
      error = 'Fail';
      isLoading = false;
    }, (r) {
      suggestions = r;
      isLoading = false;
    });
    notifyListeners();
  }
}
