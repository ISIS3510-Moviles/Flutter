// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'reservations_by_date.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ReservationsByDateAdapter extends TypeAdapter<ReservationsByDate> {
  @override
  final int typeId = 4;

  @override
  ReservationsByDate read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ReservationsByDate(
      fields[0] as DateTime,
      (fields[1] as List).cast<CachedReservation>(),
    );
  }

  @override
  void write(BinaryWriter writer, ReservationsByDate obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.reservations);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ReservationsByDateAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
