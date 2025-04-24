import 'package:campus_bites/domain/entities/reservation_entity.dart';

abstract class ReservationDatasource {
  Future<List<ReservationEntity>> getReservationsByUserId(String userId);
  Future<String> createReservation({
    required String userId,
    required String date,
    required String time,
    required int numberComensals,
    required bool isCompleted,
    required String restaurantId,
  });
}
