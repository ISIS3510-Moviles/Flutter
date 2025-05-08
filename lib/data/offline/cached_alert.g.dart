// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_alert.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedAlertAdapter extends TypeAdapter<CachedAlert> {
  @override
  final int typeId = 6;

  @override
  CachedAlert read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedAlert(
      id: fields[0] as String,
      message: fields[1] as String,
      date: fields[2] as DateTime,
      icon: fields[3] as String,
      restaurantId: fields[4] as String,
      votes: fields[5] as int,
      publisherId: fields[6] as String,
      restaurantPhoto: fields[7] as String,
      restaurantName: fields[8] as String,
    );
  }

  @override
  void write(BinaryWriter writer, CachedAlert obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.message)
      ..writeByte(2)
      ..write(obj.date)
      ..writeByte(3)
      ..write(obj.icon)
      ..writeByte(4)
      ..write(obj.restaurantId)
      ..writeByte(5)
      ..write(obj.votes)
      ..writeByte(6)
      ..write(obj.publisherId)
      ..writeByte(7)
      ..write(obj.restaurantPhoto)
      ..writeByte(8)
      ..write(obj.restaurantName);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedAlertAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
