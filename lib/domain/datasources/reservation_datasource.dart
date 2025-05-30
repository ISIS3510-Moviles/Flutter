import 'package:campus_bites/domain/entities/reservation_entity.dart';

abstract class ReservationDatasource {
  Future<List<ReservationEntity>> getReservationsByUserId(String userId);
  Future<List<ReservationEntity>> getReservationsByRestaurantId(String restaurantId);
  Future<List<ReservationEntity>> cancelReservation(String restaurantId);
  Future<List<ReservationEntity>> confirmReservation(String restaurantId);
  Future<String> createReservation({
    required String userId,
    required String date,
    required String time,
    required int numberComensals,
    required bool isCompleted,
    required String restaurantId,
  });
}
