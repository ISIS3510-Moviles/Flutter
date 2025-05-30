import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/entities/reservation_state.dart';

class CancelledState implements ReservationState {
  @override
  void complete(ReservationEntity reservation) {
    print("Reservation is already cancelled.");
  }

  @override
  String getStatus() => "Cancelled";
}