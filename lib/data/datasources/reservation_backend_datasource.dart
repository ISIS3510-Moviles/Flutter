import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/reservation_mapper.dart';
import 'package:campus_bites/data/models/reservation_backend.dart';
import 'package:campus_bites/domain/datasources/reservation_datasource.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';

class ReservationBackendDatasource extends ReservationDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<ReservationEntity> _jsonToReservations(
      List<ReservationBackend> backEntities) {
    return backEntities
        .map(ReservationMapper.reservationBackendToEntity)
        .toList();
  }

  @override
  Future<List<ReservationEntity>> getReservationsByUserId(String userId) async {
    final response = await dio.get('/reservation/by-user/$userId');
    final reservationsBackend = (response.data as List)
        .map((r) => ReservationBackend.fromJson(r))
        .toList();
    return _jsonToReservations(reservationsBackend);
  }

  @override
  Future<List<ReservationEntity>> getReservationsByRestaurantId(
      String restaurantId) async {
    final response = await dio.get('/reservation/by-restaurant/$restaurantId');
    final reservationsBackend = (response.data as List)
        .map((r) => ReservationBackend.fromJson(r))
        .toList();
    return _jsonToReservations(reservationsBackend);
  }

@override
Future<List<ReservationEntity>> cancelReservation(String reservationId) async {
  final response = await dio.patch('/reservation/$reservationId/cancel');
  final reservationMap = response.data; 
  final reservation = ReservationBackend.fromJson(reservationMap);
  return [ReservationMapper.reservationBackendToEntity(reservation)];
}


  @override
  Future<String> createReservation({
    required String userId,
    required String date,
    required String time,
    required int numberComensals,
    required bool isCompleted,
    required String restaurantId,
  }) async {
    try {
      final DateFormat inputFormat = DateFormat('MM/dd/yyyy');
      final DateTime parsedDate = inputFormat.parse(date);

      final DateTime now = DateTime.now();
      if (parsedDate.isBefore(now)) {
        throw Exception('The reservation date cannot be in the past.');
      }

      final String formattedDate =
          DateFormat("yyyy-MM-dd'T'00:00:00'Z'").format(parsedDate.toUtc());
      final requestBody = {
        "date": formattedDate,
        "time": time,
        "numberComensals": numberComensals,
        "isCompleted": isCompleted,
        "restaurant_id": restaurantId,
        "user_id": userId,
        
      };

      final response = await dio.post(
        '/reservation',
        data: requestBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['id'];
      } else {
        throw Exception('Failed to create reservation: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating reservation: $e');
    }
  }
}
