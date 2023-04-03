import 'dart:convert';
import '../../../../const/const_api_url.dart';
import '../models/wallpaper_model.dart';
import 'package:http/http.dart' as http;

abstract class ImageDatabase {
  Future<Iterable<WallpaperModel>> getImagesFromApi(int page, String url);
  Future<WallpaperModel> getTagsAndUploader(String id);
}

class ImageDatabaseImpl extends ImageDatabase {
  @override
  Future<Iterable<WallpaperModel>> getImagesFromApi(
      int page, String url) async {
    final response = await http.get(Uri.parse(url + page.toString()));
    if (response.statusCode == 200) {
      final data = await json.decode(response.body);
      List items = data["data"];
      return Future.value(items.map((e) => WallpaperModel.fromJson(e)));
    } else {
      throw Exception(
          'Failed to load images. Status code: ${response.statusCode}');
    }
  }

  @override
  Future<WallpaperModel> getTagsAndUploader(String id) async {
    final response = await http.get(Uri.parse(kImageUrl + id));
    if (response.statusCode == 200) {
      final data = await json.decode(response.body);
      return WallpaperModel.fromJson(data['data']);
    } else {
      throw Exception(
          'Failed to load images. Status code: ${response.statusCode}');
    }
  }
}
