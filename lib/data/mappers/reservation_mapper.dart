import 'package:campus_bites/data/models/reservation_backend.dart';
import 'package:campus_bites/domain/entities/pending_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';

class ReservationMapper {
  static ReservationEntity reservationBackendToEntity(ReservationBackend reservationBackend) {
    return ReservationEntity(
      id: reservationBackend.id,
      date: reservationBackend.date.toString(),
      time: reservationBackend.time.toString(),
      numberComensals: reservationBackend.numberComensals,
      state: reservationBackend.isCompleted ? CompletedState() : PendingState(),
    );
  }
}
