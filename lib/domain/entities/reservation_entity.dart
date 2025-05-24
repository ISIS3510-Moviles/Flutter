import 'package:campus_bites/domain/entities/reservation_state.dart';

class ReservationEntity {
  String id;
  String date;
  String time;
  int numberComensals;
  ReservationState state;
  bool hasBeenCancelled;

  ReservationEntity({
    required this.id,
    required this.date,
    required this.time,
    required this.numberComensals,
    required this.state,
    this.hasBeenCancelled = false,
  });

  void setState(ReservationState newState) {
    state = newState;
  }
}
