// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallpaper.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class WallpaperAdapter extends TypeAdapter<Wallpaper> {
  @override
  final int typeId = 0;

  @override
  Wallpaper read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Wallpaper(
      path: fields[0] as String,
      id: fields[1] as String,
      category: fields[2] as String,
      size: fields[3] as int,
      views: fields[4] as int,
      resolution: fields[5] as String,
      colors: (fields[6] as List).cast<dynamic>(),
      shortUrl: fields[7] as String,
      fileType: fields[8] as String,
      name: fields[9] as String,
      uploaderName: fields[10] as String,
      thumbsLarge: fields[11] as String,
      isFavorite: fields[12] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, Wallpaper obj) {
    writer
      ..writeByte(13)
      ..writeByte(0)
      ..write(obj.path)
      ..writeByte(1)
      ..write(obj.id)
      ..writeByte(2)
      ..write(obj.category)
      ..writeByte(3)
      ..write(obj.size)
      ..writeByte(4)
      ..write(obj.views)
      ..writeByte(5)
      ..write(obj.resolution)
      ..writeByte(6)
      ..write(obj.colors)
      ..writeByte(7)
      ..write(obj.shortUrl)
      ..writeByte(8)
      ..write(obj.fileType)
      ..writeByte(9)
      ..write(obj.name)
      ..writeByte(10)
      ..write(obj.uploaderName)
      ..writeByte(11)
      ..write(obj.thumbsLarge)
      ..writeByte(12)
      ..write(obj.isFavorite);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is WallpaperAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
