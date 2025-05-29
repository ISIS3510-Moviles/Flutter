// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'food_tag.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class FoodTagAdapter extends TypeAdapter<FoodTag> {
  @override
  final int typeId = 2;

  @override
  FoodTag read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return FoodTag(
      id: fields[0] as String,
      name: fields[1] as String,
      icon: fields[2] as String,
    );
  }

  @override
  void write(BinaryWriter writer, FoodTag obj) {
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
      other is FoodTagAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
