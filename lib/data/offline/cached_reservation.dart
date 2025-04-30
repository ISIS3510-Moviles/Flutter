import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:hive/hive.dart';

part 'cached_reservation.g.dart';

@HiveType(typeId: 5)
class CachedReservation extends HiveObject {
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

  CachedReservation({
    required this.id,
    required this.date,
    required this.time,
    required this.numberComensals,
    required this.isCompleted,
  });

  factory CachedReservation.fromReservation(ReservationEntity reservation) {
    return CachedReservation(
      id: reservation.id,
      date: reservation.date,
      time: reservation.time,
      numberComensals: reservation.numberComensals,
      isCompleted: reservation.state.getStatus() == 'Completed' ? true : false,
    );
  }
}
