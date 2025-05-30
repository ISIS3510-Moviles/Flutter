import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/reservation_mapper.dart';
import 'package:campus_bites/data/models/reservation_backend.dart';
import 'package:campus_bites/domain/datasources/reservation_datasource.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:dio/dio.dart';
import 'package:intl/intl.dart';
import 'dart:developer' as developer;

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
    developer.log(
      'Fetching reservations for user id: $userId',
      name: 'ReservationBackendDatasource',
    );
    final response = await dio.get('/reservation/by-user/$userId');
    developer.log(
      'Received reservations for user id $userId: ${response.data}',
      name: 'ReservationBackendDatasource',
    );
    final reservationsBackend = (response.data as List)
        .map((r) => ReservationBackend.fromJson(r))
        .toList();
    return _jsonToReservations(reservationsBackend);
  }

  @override
  Future<List<ReservationEntity>> getReservationsByRestaurantId(
      String restaurantId) async {
    developer.log(
      'Fetching reservations for restaurant id: $restaurantId',
      name: 'ReservationBackendDatasource',
    );
    final response = await dio.get('/reservation/by-restaurant/$restaurantId');
    developer.log(
      'Received reservations for restaurant id $restaurantId: ${response.data}',
      name: 'ReservationBackendDatasource',
    );
    final reservationsBackend = (response.data as List)
        .map((r) => ReservationBackend.fromJson(r))
        .toList();
    return _jsonToReservations(reservationsBackend);
  }

  @override
  Future<List<ReservationEntity>> cancelReservation(String reservationId) async {
    developer.log(
      'Cancelling reservation with id: $reservationId',
      name: 'ReservationBackendDatasource',
    );
    final response = await dio.patch('/reservation/$reservationId/cancel');
    developer.log(
      'Cancellation response for reservation id $reservationId: ${response.data}',
      name: 'ReservationBackendDatasource',
    );
    final reservationMap = response.data; 
    final reservation = ReservationBackend.fromJson(reservationMap);
    return [ReservationMapper.reservationBackendToEntity(reservation)];
  }


  @override
  Future<List<ReservationEntity>> confirmReservation(String reservationId) async {
    developer.log(
      'Confirming reservation with id: $reservationId',
      name: 'ReservationBackendDatasource',
    );
    final response = await dio.patch('/reservation/$reservationId/complete');
    developer.log(
      'Confirmation response for reservation id $reservationId: ${response.data}',
      name: 'ReservationBackendDatasource',
    );
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
      developer.log(
        'Creating reservation for user id $userId at restaurant id $restaurantId with date: $date and time: $time',
        name: 'ReservationBackendDatasource',
      );
      final String dateTimeString = '$date $time';
      final DateFormat inputFormat = DateFormat('MM/dd/yyyy HH:mm');
      final DateTime parsedDateTime = inputFormat.parse(dateTimeString);

      final DateTime now = DateTime.now();
      if (parsedDateTime.isBefore(now)) {
        throw Exception('The reservation date cannot be in the past.');
      }

      final String formattedDate =
          DateFormat("yyyy-MM-dd'T'HH:mm:ss'Z'").format(parsedDateTime.toUtc());
      developer.log(
        'Parsed date time to UTC: $formattedDate',
        name: 'ReservationBackendDatasource',
      );
      final requestBody = {
        "date": formattedDate,
        "time": time,
        "numberComensals": numberComensals,
        "isCompleted": isCompleted,
        "restaurant_id": restaurantId,
        "user_id": userId,
      };
      developer.log(
        'Request Body for creating reservation: $requestBody',
        name: 'ReservationBackendDatasource',
      );

      final response = await dio.post(
        '/reservation',
        data: requestBody,
      );

      developer.log(
        'Create reservation response: ${response.data}',
        name: 'ReservationBackendDatasource',
      );
      if (response.statusCode == 200 || response.statusCode == 201) {
        return response.data['id'];
      } else {
        throw Exception('Failed to create reservation: ${response.statusCode}');
      }
    } catch (e) {
      developer.log(
        'Error creating reservation: $e',
        name: 'ReservationBackendDatasource',
        error: e,
      );
      throw Exception('Error creating reservation: $e');
    }
  }
}