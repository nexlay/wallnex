import 'dart:convert';
import '../../../../const/const_api_url.dart';
import '../../../images/data/models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

abstract class SuggestionsData {
  //Suggestions by tags
  Future<Iterable<WallpaperModel>> getSuggestionsBySimilarTags(String id);
  Future<Iterable<WallpaperModel>> getSuggestionsByColors(
      String color, String id);
}

class SuggestionsDataImpl implements SuggestionsData {
  @override
  Future<Iterable<WallpaperModel>> getSuggestionsBySimilarTags(
      String id) async {
    final response = await http.get(
      Uri.parse('$kSearchLikeIdUrl$id'),
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

  @override
  Future<Iterable<WallpaperModel>> getSuggestionsByColors(
      String color, String id) async {
    final response = await http.get(
      Uri.parse('$kSearchByColor$color'),
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
