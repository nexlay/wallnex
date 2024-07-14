import 'package:flutter/cupertino.dart';
import 'package:translator/translator.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../const/const_api_url.dart';
import '../../domain/entities/wallpaper.dart';
import '../../domain/usecases/get_image_use_case.dart';
import '../../domain/usecases/get_tags_uploader_use_case.dart';

class GetImagesNotifier extends ValueNotifier<int> {
  final GetImageUseCase getWallpaperUseCase;
  final GetTagsAndUploaderUseCase getSingleWallpaperUseCase;

  GetImagesNotifier({
    required this.getWallpaperUseCase,
    required this.getSingleWallpaperUseCase,
  }) : super(1);

  bool _isLoading = false;
  bool _isSelectedPage = false;
  List<Wallpaper> _imageList = [];
  Wallpaper _wallpaper = Wallpaper.initialValue();

  String _error = '';
  String _searchUrl = kSearchUrl + kPage;

  bool get isLoading => _isLoading;
  bool get isSelectedPage => _isSelectedPage;
  List<Wallpaper> get imageList => _imageList;
  Wallpaper get wallpaper => _wallpaper;
  String get error => _error;

  final translator = GoogleTranslator();

  void incrementPage() {
    value++;
    _isSelectedPage = true;
    notifyListeners();
    loadImages();
  }

  void decrementPage() {
    value--;
    notifyListeners();
    loadImages();
  }

  Future<void> searchByCategories(String category) async {
    _searchUrl = kSearchUrl + category + kPage;
    value = 1;
    notifyListeners();
    loadImages();
  }

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

  void searchBySorting(String sorting) {
    _searchUrl = kSortingImagesUrl + sorting + kPage;
    value = 1;
    notifyListeners();
    loadImages();
  }

  void reload() {
    _searchUrl = kSearchUrl + kPage;
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

  Future<void> getImageById(String id) async {
    // show loading
    _isLoading = true;
    notifyListeners();
    // Fetch the image
    final result = await getSingleWallpaperUseCase(
      ParamsString(params: id),
    );
    // Handle success or error
    result.fold(
      (e) {
        _error =
            "Failed to load image"; // Provide a more informative error message
        _isLoading = false;
      },
      (imageById) {
        _wallpaper = imageById;
        _isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }
}
