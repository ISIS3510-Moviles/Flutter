// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'dietary_tag.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DietaryTagAdapter extends TypeAdapter<DietaryTag> {
  @override
  final int typeId = 3;

  @override
  DietaryTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DietaryTag(
      id: fields[0] as String,
      name: fields[1] as String,
      icon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, DietaryTag obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.icon);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DietaryTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
