import 'package:campus_bites/domain/entities/reservation_entity.dart';

abstract class ReservationRepository {
  Future<List<ReservationEntity>> getReservationsByUserId(String id);
  Future<List<ReservationEntity>> getReservationsByRestaurantId(String id);
  Future<List<ReservationEntity>> cancelReservation(String id);
}
