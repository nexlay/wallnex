import 'package:cloud_firestore/cloud_firestore.dart';

import '../../domain/entities/wallpaper.dart';

class WallpaperModel extends Wallpaper {
   WallpaperModel({
    required super.path,
    required super.id,
    required super.category,
    required super.size,
    required super.views,
    required super.resolution,
    required super.colors,
    required super.shortUrl,
    required super.fileType,
    required super.name,
    required super.uploaderName,
    required super.thumbsLarge,
    required super.isFavorite,
  });

  factory WallpaperModel.fromJson(
    Map<String, dynamic> map,
  ) {
    return WallpaperModel(
      path: map['path'] ?? '',
      id: map['id'] ?? '',
      category: map['category'] ?? '',
      size: map['file_size'] ?? 0,
      views: map['views'] ?? 0,
      resolution: map['resolution'] ?? '',
      colors: map['colors'] ?? [],
      shortUrl: map['short_url'] ?? '',
      fileType: map['file_type'] ?? '',
      name: map['tags']?[0]?['name'] ?? '',
      uploaderName: map['uploader']?['username'] ?? '',
      thumbsLarge: map['thumbs']['large'] ?? '',
      isFavorite: false,
    );
  }

  factory WallpaperModel.fromIterable(Wallpaper wallpaper) {
    return WallpaperModel(
      path: wallpaper.path,
      id: wallpaper.id,
      category: wallpaper.category,
      size: wallpaper.size,
      views: wallpaper.views,
      resolution: wallpaper.resolution,
      colors: wallpaper.colors,
      shortUrl: wallpaper.shortUrl,
      fileType: wallpaper.fileType,
      name: wallpaper.name,
      uploaderName: wallpaper.uploaderName,
      thumbsLarge: wallpaper.thumbsLarge,
      isFavorite: wallpaper.isFavorite,
    );
  }

  factory WallpaperModel.fromFireStore(
      DocumentSnapshot<Map<String, dynamic>> snapshot,
      SnapshotOptions options) {
    final data = snapshot.data();
    return WallpaperModel(
      path: data?['path'],
      id: data?['id'],
      category: data?['category'],
      size: data?['size'],
      views: data?['views'],
      resolution: data?['resolution'],
      colors: data?['colors'],
      shortUrl: data?['shortUrl'],
      fileType: data?['fileType'],
      name: data?['name'],
      uploaderName: data?['uploaderName'],
      thumbsLarge: data?['thumbsLarge'],
      isFavorite: data?['isFavorite'],
    );
  }

  Map<String, dynamic> toFireStore() {
    return {
      'path': path,
      'id': id,
      'category': category,
      'size': size,
      'views': views,
      'resolution': resolution,
      'colors': colors,
      'shortUrl': shortUrl,
      'fileType': fileType,
      'name': name,
      'uploaderName': uploaderName,
      'thumbsLarge': thumbsLarge,
      'isFavorite': isFavorite,
    };
  }

  factory WallpaperModel.fromQueryDocumentSnapshot(
      QueryDocumentSnapshot snapshot) {
    return WallpaperModel(
      path: snapshot.get('path'),
      id: snapshot.get('id'),
      category: snapshot.get('category'),
      size: snapshot.get('size'),
      views: snapshot.get('views'),
      resolution: snapshot.get('resolution'),
      colors: snapshot.get('colors'),
      shortUrl: snapshot.get('shortUrl'),
      fileType: snapshot.get('fileType'),
      name: snapshot.get('name'),
      uploaderName: snapshot.get('uploaderName'),
      thumbsLarge: snapshot.get('thumbsLarge'),
      isFavorite: snapshot.data().toString().contains('isFavorite') ? snapshot.get('isFavorite') : true,
    );
  }

  List<WallpaperModel> fromQuerySnapshot(QuerySnapshot snapshot) {
    return snapshot.docs
        .map(
          (e) => WallpaperModel(
            path: e.get('path'),
            id: e.get('path'),
            category: e.get('path'),
            size: e.get('path'),
            views: e.get('path'),
            resolution: e.get('path'),
            colors: e.get('path'),
            shortUrl: e.get('path'),
            fileType: e.get('path'),
            name: e.get('path'),
            uploaderName: e.get('path'),
            thumbsLarge: e.get('path'),
            isFavorite: e.get('isFavorite'),
          ),
        )
        .toList();
  }
}
