// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cached_reservation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class CachedReservationAdapter extends TypeAdapter<CachedReservation> {
  @override
  final int typeId = 5;

  @override
  CachedReservation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return CachedReservation(
      id: fields[0] as String,
      date: fields[1] as String,
      time: fields[2] as String,
      numberComensals: fields[3] as int,
      isCompleted: fields[4] as bool,
    );
  }

  @override
  void write(BinaryWriter writer, CachedReservation obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.numberComensals)
      ..writeByte(4)
      ..write(obj.isCompleted);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is CachedReservationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
