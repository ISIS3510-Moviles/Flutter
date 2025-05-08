import 'package:campus_bites/data/offline/cached_alert.dart';
import 'package:hive/hive.dart';

part 'alerts_by_date.g.dart';

@HiveType(typeId: 7)
class AlertsByDate extends HiveObject {
  @HiveField(0)
  final DateTime date;

  @HiveField(1)
  final List<CachedAlert> alerts;

  AlertsByDate(this.date, this.alerts);
}
