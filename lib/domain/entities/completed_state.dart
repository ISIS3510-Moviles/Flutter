import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/entities/reservation_state.dart';

class CompletedState implements ReservationState {
  @override
  void complete(ReservationEntity reservation) {
    print("Reservation is already completed.");
  }

  @override
  String getStatus() => "Completed";
}