import 'package:campus_bites/data/offline/cached_reservation.dart';
import 'package:hive/hive.dart';
import 'queued_reservation.dart';

part 'reservations_by_date.g.dart';

@HiveType(typeId: 4)
class ReservationsByDate extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final List<CachedReservation> reservations;

  ReservationsByDate(this.date, this.reservations);
}
