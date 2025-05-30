import 'package:campus_bites/data/models/reservation_backend.dart';
import 'package:campus_bites/domain/entities/cancelled_state.dart';
import 'package:campus_bites/domain/entities/completed_state.dart';
import 'package:campus_bites/domain/entities/pending_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';

class ReservationMapper {
  static ReservationEntity reservationBackendToEntity(ReservationBackend reservationBackend) {
    return ReservationEntity(
      id: reservationBackend.id,
      date: reservationBackend.date.toIso8601String(),
      time: reservationBackend.time,
      numberComensals: reservationBackend.numberComensals,
      state: reservationBackend.isCompleted ? CompletedState() : (reservationBackend.hasBeenCancelled ?? false) ? CancelledState() : PendingState(),
      hasBeenCancelled: reservationBackend.hasBeenCancelled ?? false,
    );
  }
}
