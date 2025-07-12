import 'package:flutter/cupertino.dart';
import 'package:wallnex/core/usecase/usecase.dart';
import '../../../../const/const_api_url.dart';
import '../../domain/entities/wallpaper.dart';
import '../../domain/usecases/get_image_use_case.dart';

class SortingImagesNotifier extends ValueNotifier<int> {
  final GetImageUseCase getWallpaperUseCase;

  SortingImagesNotifier({
    required this.getWallpaperUseCase,
  }) : super(1);

  bool _isLoading = false;
  List<Wallpaper> _imageList = [];

  String _error = '';
  String _searchUrl = kSearchUrl + kPage;

  bool get isLoading => _isLoading;
  List<Wallpaper> get imageList => _imageList;
  String get error => _error;

  void searchBySorting(String sorting) {
    _searchUrl = kSortingImagesUrl + sorting + kPage;
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
