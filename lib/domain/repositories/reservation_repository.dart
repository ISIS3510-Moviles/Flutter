import 'package:campus_bites/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {
  Future<List<ReservationEntity>> getReservationsByUserId(String id);
}