// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_user.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class SearchUserAdapter extends TypeAdapter<SearchUser> {
  @override
  final int typeId = 1;

  @override
  SearchUser read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return SearchUser(
      uId: fields[0] as String,
      email: fields[1] as String,
      name: fields[2] as String,
      photoUrl: fields[3] as String,
      isAnonymous: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, SearchUser obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.uId)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.name)
      ..writeByte(3)
      ..write(obj.photoUrl)
      ..writeByte(4)
      ..write(obj.isAnonymous);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is SearchUserAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
