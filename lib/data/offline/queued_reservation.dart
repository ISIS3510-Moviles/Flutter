import 'package:hive/hive.dart';

part 'queued_reservation.g.dart';

@HiveType(typeId: 1)
class QueuedReservation extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String date;

  @HiveField(2)
  String time;

  @HiveField(3)
  int numberComensals;

  @HiveField(4)
  bool isCompleted;

  @HiveField(5)
  String userId;

  @HiveField(6)
  String restaurantId;

  QueuedReservation({
    required this.id,
    required this.date,
    required this.time,
    required this.numberComensals,
    required this.isCompleted,
    required this.userId,
    required this.restaurantId,
  });
}
