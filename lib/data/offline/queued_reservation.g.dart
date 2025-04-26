// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_reservation.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueuedReservationAdapter extends TypeAdapter<QueuedReservation> {
  @override
  final int typeId = 1;

  @override
  QueuedReservation read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueuedReservation(
      id: fields[0] as String,
      date: fields[1] as String,
      time: fields[2] as String,
      numberComensals: fields[3] as int,
      isCompleted: fields[4] as bool,
      userId: fields[5] as String,
      restaurantId: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QueuedReservation obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.date)
      ..writeByte(2)
      ..write(obj.time)
      ..writeByte(3)
      ..write(obj.numberComensals)
      ..writeByte(4)
      ..write(obj.isCompleted)
      ..writeByte(5)
      ..write(obj.userId)
      ..writeByte(6)
      ..write(obj.restaurantId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueuedReservationAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
