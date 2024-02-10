import 'dart:convert';
import '../../../images/data/models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

abstract class SuggestionsData {
  //Suggestions
  Future<Iterable<WallpaperModel>> getSuggestions(String id);
}

class SuggestionsDataImpl implements SuggestionsData {
  @override
  Future<Iterable<WallpaperModel>> getSuggestions(String id) async {
    final response = await http.get(
      Uri.parse('https://wallhaven.cc/api/v1/search?q=like:$id'),
    );

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      List items = data['data'];

      for (var e in items) {
        if (e.toString().contains(id)) {
          items.remove(e);
          break;
        }
      }

      return Future.value(items.map((e) => WallpaperModel.fromJson(e)));
    } else {
      throw Exception(
          'Failed to load images. Status code: ${response.statusCode}');
    }
  }
}
