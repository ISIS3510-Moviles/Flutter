import 'package:campus_bites/domain/entities/alert_entity.dart';
import 'package:campus_bites/domain/repositories/alert_repository.dart';
import 'package:campus_bites/data/datasources/alert_backend_datasource.dart';


class AlertRepositoryImpl extends AlertRepository {
  final AlertBackendDatasource alertBackendDatasource;

  AlertRepositoryImpl(this.alertBackendDatasource);
  
  @override
  Future<List<AlertEntity>> getAlertsByUserId(String id) async {
    try {
      return await alertBackendDatasource.getAlertsByUserId(id);
    } catch (e) {
      throw Exception('Error fetching alerts: $e');
    }
  }
}
