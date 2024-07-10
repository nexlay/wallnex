import 'package:flutter/cupertino.dart';
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

  bool isLoading = false;
  bool isSelectedPage = false;
  List<Wallpaper> imageList = [];
  Wallpaper wallpaper = Wallpaper.initialValue();

  String error = '';

  String _searchUrl = kSearchUrl + kPage;

  pagePlus() {
    value++;
    isSelectedPage = true;
    notifyListeners();
    loadImages();
  }

  pageMinus() {
    value--;
    notifyListeners();
    loadImages();
  }

  Future<void>searchByCategories(String category) async {
    _searchUrl = kSearchUrl + category + kPage;
    value = 1;
    notifyListeners();
    loadImages();
  }

  searchByQuery(String query) {
    _searchUrl = kSearchUrl + query + kPage;
    value = 1;
    notifyListeners();
    loadImages();
  }

  searchBySorting(String sorting) {
    _searchUrl = kSortingImagesUrl + sorting + kPage;
    value = 1;
    notifyListeners();

    loadImages();
  }

  reload() {
    _searchUrl = kSearchUrl + kPage;
    value = 1;
    notifyListeners();
    loadImages();
  }

  Future<void> loadImages() async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the list
    final result = await getWallpaperUseCase(
      UrlAndPage(params1: _searchUrl, params2: value),
    );
    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (r) {
        imageList = r.toList();
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }

  Future<void> getImageById(String id) async {
    // show loading
    isLoading = true;
    notifyListeners();
    // Fetch the image
    final result = await getSingleWallpaperUseCase(
      ParamsString(params: id),
    );
    // Handle success or error
    result.fold(
      (e) {
        error = "fail";
        isLoading = false;
      },
      (imageById) {
        wallpaper = imageById;
        isLoading = false;
      },
    );
    // notify UI
    notifyListeners();
  }
}
