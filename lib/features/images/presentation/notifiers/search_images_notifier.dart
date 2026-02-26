import 'package:flutter/cupertino.dart';
import 'package:translator/translator.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../const/const_api_url.dart';
import '../../domain/entities/wallpaper.dart';
import '../../domain/usecases/get_image_use_case.dart';

class SearchImagesNotifier extends ValueNotifier<int> {
  final GetImageUseCase getWallpaperUseCase;

  SearchImagesNotifier({
    required this.getWallpaperUseCase,
  }) : super(1);

  bool _isLoading = false;
  List<Wallpaper> _imageList = [];

  String _error = '';
  String _searchUrl = kSearchUrl + kPage;

  bool get isLoading => _isLoading;
  List<Wallpaper> get imageList => _imageList;
  String get error => _error;

  final translator = GoogleTranslator();

  Future<String> _translateQuery(String query) async {
    final translatedQuery = await translator.translate(query, to: 'en');
    return translatedQuery.text;
  }

  void searchByQuery(String query) async {
    String translatedQuery = await _translateQuery(query);
    _searchUrl = kSearchUrl + translatedQuery + kPage;
    value = 1;
    notifyListeners();
    loadImages();
  }

  Future<void> loadImages() async {
    // show loading
    _isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await getWallpaperUseCase(
      UrlAndPage(params1: _searchUrl, params2: value),
    );
    // Handle success or error
    result.fold(
      (e) {
        _error =
            "Failed to load images"; // Provide a more informative error message
        _isLoading = false;
      },
      (r) {
        _imageList = r.toList();
        _isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }
}
