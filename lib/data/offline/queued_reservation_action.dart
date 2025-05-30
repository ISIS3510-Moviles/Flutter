import 'package:hive/hive.dart';

part 'queued_reservation_action.g.dart';

@HiveType(typeId: 17)
class QueuedReservationAction extends HiveObject {
  @HiveField(0)
  String reservationId;


  @HiveField(1)
  String action;

  QueuedReservationAction({
    required this.reservationId,
    required this.action,
  });
}