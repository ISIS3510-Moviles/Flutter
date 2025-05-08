import 'package:campus_bites/domain/entities/alert_entity.dart';

abstract class AlertRepository {
  Future<List<AlertEntity>> getAlertsByUserId(String id);
}