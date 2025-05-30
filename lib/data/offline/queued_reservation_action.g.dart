// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_reservation_action.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueuedReservationActionAdapter
    extends TypeAdapter<QueuedReservationAction> {
  @override
  final int typeId = 17;

  @override
  QueuedReservationAction read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueuedReservationAction(
      reservationId: fields[0] as String,
      action: fields[1] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QueuedReservationAction obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.reservationId)
      ..writeByte(1)
      ..write(obj.action);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueuedReservationActionAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
