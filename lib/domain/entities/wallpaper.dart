import 'package:equatable/equatable.dart';

class Wallpaper extends Equatable {
  final String path;
  final String id;
  final String category;
  final String name;
  final String size;
  final String downloads;
  final String resolution;
  final List<dynamic> colors;



   const Wallpaper(
      {required this.path,
      required this.id,
      required this.category,
      required this.name,
      required this.size,
      required this.downloads,
      required this.resolution,
      required this.colors,
     });

  @override
  List<Object?> get props =>
      [path, id, category, name, size, downloads, resolution, colors,];

  Map<String, dynamic> toJson() {
    return {
      'path': path,
      'imageId': id,
      'category': category,
      'name': name,
      'size': size,
      'downloads': downloads,
      'resolution': resolution,
      'colors': colors.toString().replaceAll(' ', '').replaceAll('[', '').replaceAll(']', ''),

    };
  }
}
