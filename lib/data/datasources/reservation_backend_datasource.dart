import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/reservation_mapper.dart';
import 'package:campus_bites/data/models/reservation_backend.dart';
import 'package:campus_bites/domain/datasources/reservation_datasource.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:dio/dio.dart';

class ReservationBackendDatasource extends ReservationDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<ReservationEntity> _jsonToReservations(List<dynamic> json) {
    return json.map((e) => ReservationMapper.reservationBackendToEntity(ReservationBackend.fromJson(e))).toList();
  }

  @override
  Future<List<ReservationEntity>> getReservations() async {
    final response = await dio.get('/reservation');
    return _jsonToReservations(response.data);
  }
}
