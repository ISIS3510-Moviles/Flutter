import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/repositories/reservation_repository.dart';
import 'package:campus_bites/data/datasources/reservation_backend_datasource.dart';


class ReservationRepositoryImpl extends ReservationRepository {
  final ReservationBackendDatasource reservationBackendDatasource;

  ReservationRepositoryImpl(this.reservationBackendDatasource);
  
  @override
  Future<List<ReservationEntity>> getReservationsByUserId(String id) async {
    try {
      print('Fetching reservations for user ID: $id');
      
      return await reservationBackendDatasource.getReservationsByUserId(id);
    } catch (e) {
      throw Exception('Error fetching reservations: $e');
    }
  }

@override
  Future<List<ReservationEntity>> getReservationsByRestaurantId(String id) async {
    try {
      return await reservationBackendDatasource.getReservationsByRestaurantId(id);
    } catch (e) {
      throw Exception('Error fetching reservations: $e');
    }
  }

  @override
  Future<List<ReservationEntity>> cancelReservation(String id) async {
    try {
      return await reservationBackendDatasource.cancelReservation(id);
    } catch (e) {
      throw Exception('Error fetching reservations: $e');
    }
  }

  @override
  Future<List<ReservationEntity>> confirmReservation(String id) async {
    try {
      return await reservationBackendDatasource.confirmReservation(id);
    } catch (e) {
      throw Exception('Error fetching reservations: $e');
    }
  }
}
