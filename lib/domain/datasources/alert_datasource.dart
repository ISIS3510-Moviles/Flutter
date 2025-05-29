import 'package:campus_bites/domain/entities/alert_entity.dart';

abstract class AlertDatasource {
  Future<List<AlertEntity>> getAlertsByUserId(String userId);
}