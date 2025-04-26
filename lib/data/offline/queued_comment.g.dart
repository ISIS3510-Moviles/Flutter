// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'queued_comment.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class QueuedCommentAdapter extends TypeAdapter<QueuedComment> {
  @override
  final int typeId = 0;

  @override
  QueuedComment read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return QueuedComment(
      message: fields[0] as String,
      rating: fields[1] as double,
      productId: fields[2] as String,
      restaurantId: fields[3] as String,
      authorId: fields[4] as String,
    );
  }

  @override
  void write(BinaryWriter writer, QueuedComment obj) {
    writer
      ..writeByte(5)
      ..writeByte(0)
      ..write(obj.message)
      ..writeByte(1)
      ..write(obj.rating)
      ..writeByte(2)
      ..write(obj.productId)
      ..writeByte(3)
      ..write(obj.restaurantId)
      ..writeByte(4)
      ..write(obj.authorId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is QueuedCommentAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
