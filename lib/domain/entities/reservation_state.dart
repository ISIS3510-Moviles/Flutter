import 'package:campus_bites/domain/entities/reservation_entity.dart';

abstract class ReservationState {
  void complete(ReservationEntity reservation);
  String getStatus();
}