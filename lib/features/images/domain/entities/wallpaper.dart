import 'package:equatable/equatable.dart';
import 'package:hive/hive.dart';
part 'wallpaper.g.dart';

@HiveType(typeId: 0)
class Wallpaper extends Equatable {
  @HiveField(0)
  final String path;
  @HiveField(1)
  final String id;
  @HiveField(2)
  final String category;
  @HiveField(3)
  final int size;
  @HiveField(4)
  final int views;
  @HiveField(5)
  final String resolution;
  @HiveField(6)
  final List<dynamic> colors;
  @HiveField(7)
  final String shortUrl;
  @HiveField(8)
  final String fileType;
  @HiveField(9)
  final String name;
  @HiveField(10)
  final String uploaderName;
  @HiveField(11)
  final String thumbsLarge;


  const Wallpaper(
      {required this.path,
      required this.id,
      required this.category,
      required this.size,
      required this.views,
      required this.resolution,
      required this.colors,
      required this.shortUrl,
      required this.fileType,
      required this.name,
      required this.uploaderName,
        required this.thumbsLarge,
      });

  @override
  List<Object?> get props => [
        path,
        id,
        category,
        size,
        views,
        resolution,
        colors,
        shortUrl,
        fileType,
        name,
        uploaderName,
    thumbsLarge,
      ];
}
