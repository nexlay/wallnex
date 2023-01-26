import 'package:hive/hive.dart';

abstract class SearchDatabase {
  Future<List<String>> getSearchHistory();
  Future<void> pushSearchHistory(String query);
}

class SearchDatabaseImpl implements SearchDatabase {
  @override
  Future<List<String>> getSearchHistory() async {
    final searchBox =  await Hive.openBox('search_history');
    return Future.value(searchBox.values.map((e) {
     return e.toString();
    }).toList());
  }

  @override
  Future<void> pushSearchHistory(String query) async {
    final searchBox = Hive.box('search_history');
    await searchBox.put(query, query);
  }
}
