// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alerts_by_date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class AlertsByDateAdapter extends TypeAdapter<AlertsByDate> {
  @override
  final int typeId = 7;

  @override
  AlertsByDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return AlertsByDate(
      fields[0] as DateTime,
      (fields[1] as List).cast<CachedAlert>(),
    );
  }

  @override
  void write(BinaryWriter writer, AlertsByDate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.alerts);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is AlertsByDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
