import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/entities/reservation_state.dart';

class PendingState implements ReservationState {
  @override
  void complete(ReservationEntity reservation) {
    reservation.setState(CompletedState());
    
  }

  @override
  String getStatus() => "Pending";
}

class CompletedState implements ReservationState {
  @override
  void complete(ReservationEntity reservation) {
    
  }

  @override
  String getStatus() => "Completed";
}
