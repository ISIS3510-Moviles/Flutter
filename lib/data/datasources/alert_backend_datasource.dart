import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/alert_mapper.dart';
import 'package:campus_bites/data/models/alert_backend.dart';
import 'package:campus_bites/domain/datasources/alert_datasource.dart';
import 'package:campus_bites/domain/entities/alert_entity.dart';
import 'package:dio/dio.dart';

class AlertBackendDatasource extends AlertDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<AlertEntity> _jsonToAlerts(List<AlertBackend> backEntities) {
    return backEntities
        .map(AlertMapper.alertBackendToEntity)
        .toList();
  }

  @override
  Future<List<AlertEntity>> getAlertsByUserId(String userId) async {
    final response = await dio.get('/alert/full/user/$userId');
    final alertsBackend = (response.data as List<dynamic>)
        .map((r) => AlertBackend.fromJson(r as Map<String, dynamic>))
        .toList();
    return _jsonToAlerts(alertsBackend);
  }
}
