import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/repositories/reservation_repository.dart';
import 'package:campus_bites/data/datasources/reservation_backend_datasource.dart';


class ReservationRepositoryImpl extends ReservationRepository {
  final ReservationBackendDatasource reservationBackendDatasource;

  ReservationRepositoryImpl(this.reservationBackendDatasource);
  
  @override
  Future<List<ReservationEntity>> getReservationsByUserId(String id) async {
    try {
      return await reservationBackendDatasource.getReservationsByUserId(id);
    } catch (e) {
      throw Exception('Error fetching reservations: $e');
    }
  }
}
