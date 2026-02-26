import 'dart:math';
import 'package:flutter/material.dart';
import 'package:wallnex/features/images/domain/entities/wallpaper.dart';
import '../../../images/presentation/provider/get_images_notifier.dart';

class CategoryImagesNotifier extends ChangeNotifier {
  final GetImagesNotifier _getImagesNotifier;

  CategoryImagesNotifier(this._getImagesNotifier);

  final Map<String, String> _imageUrls = {};
  Map<String, String> get imageUrls => _imageUrls;

  void clearImages() {
    _imageUrls.clear();
    notifyListeners();
  }

  Future<String?> fetchCategoryImage(String category) async {
    print('Fetching image for category: $category');
    if (_imageUrls.containsKey(category)) {
      print('Image already in cache: ${_imageUrls[category]}');
      return _imageUrls[category];
    }
    final wallpapers =
        await _getImagesNotifier.getWallpapersForCategory(category);
    if (wallpapers.isNotEmpty) {
      final randomImage = wallpapers[Random().nextInt(wallpapers.length)];
      _imageUrls[category] = randomImage.path;
      print('Fetched new image: ${randomImage.path}');
      notifyListeners();
      return randomImage.path;
    }
    print('No wallpapers found for category: $category');
    return null;
  }
}
