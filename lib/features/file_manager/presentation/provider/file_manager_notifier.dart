import 'dart:async';
import 'dart:ui';
import 'package:flutter/foundation.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'dart:io' as io;
import 'package:image/image.dart' as img;
import 'package:tuple/tuple.dart';


Future<String> _cropImage(Tuple3<io.File, double, int> data) async {
  img.Image? image =
      img.decodeImage(io.File(data.item1.path).readAsBytesSync());
  img.Image croppedImage = await _calculateCrop(image!, data.item2, data.item3);
  // save as new file with new resolution and path
  final resultFile = io.File('${data.item1.parent.path}/cropped-wallpaper.jpg')
    ..writeAsBytesSync(img.encodeJpg(croppedImage));

  return resultFile.path;
}

Future<img.Image> _calculateCrop(img.Image image, double dxOffset, int deviceWidth) async {
  int x = 0;
  int y = 0;
  double c = (image.width - dxOffset) / deviceWidth;
  x = (dxOffset * c).toInt();
  return img.copyCrop(image, x, y, image.width, image.height);
}

class FileManagerNotifier extends ChangeNotifier {
  String _filePath = '';
  double _dxOffset = 0.0;

  double get dxOffset => _dxOffset;
  String get filePath => _filePath;
  late io.File file;
  int deviceWidth = window.physicalSize.width.toInt();

  set dxOffset(double dx) {
    _dxOffset = dx;
    notifyListeners();
  }

  set path(String path) {
    _filePath = path;
    notifyListeners();
  }

  //Compute method for heavy calculation in the isolate thread
  Future<dynamic> cropInBackground() async {
    return compute(_cropImage, Tuple3(file, _dxOffset, deviceWidth));
  }

  
  Future<io.File> getFileFromCache() async {
    return file = await DefaultCacheManager().getSingleFile(filePath);
  }
}
