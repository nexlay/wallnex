import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import 'package:wallnex/features/search/domain/usecases/push_search_history_into_db.dart';
import '../../domain/usecases/get_search_history.dart';

class GetSearchHistoryNotifier extends ChangeNotifier {
  final PushSearchHistoryIntoDb pushSearchHistoryIntoDb;
  final GetSearchHistoryUseCase getSearchHistoryUseCase;

  GetSearchHistoryNotifier(
      {required this.pushSearchHistoryIntoDb,
      required this.getSearchHistoryUseCase});
  List<String> searchHistory = [];
  bool loading = false;
  String error = '';

  Future<void> pushSearchHistory(String query) async {
    if (query.isEmpty) {
      return;
    } else {
      await pushSearchHistoryIntoDb.call(query);
    }
    notifyListeners();
  }

  Future<void> getSearchHistory() async {
    final search = await getSearchHistoryUseCase.call(NoParams());
    search.fold((l) => error = l.toString(), (r) => searchHistory = r);
    notifyListeners();
  }
}
