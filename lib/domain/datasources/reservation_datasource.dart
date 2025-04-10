import 'package:campus_bites/domain/entities/reservation_entity.dart';

abstract class ReservationDatasource {
  Future<List<ReservationEntity>> getReservationsByUserId(String userId);
}