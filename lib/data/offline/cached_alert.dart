import 'package:campus_bites/domain/entities/alert_entity.dart';
import 'package:hive/hive.dart';

part 'cached_alert.g.dart';

@HiveType(typeId: 6)
class CachedAlert extends HiveObject {
  @HiveField(0)
  final String id;

  @HiveField(1)
  final String message;

  @HiveField(2)
  final DateTime date;

  @HiveField(3)
  final String icon;

  @HiveField(4)
  final String restaurantId;

  @HiveField(5)
  final int votes;

  @HiveField(6)
  final String publisherId;

  @HiveField(7)
  final String restaurantPhoto;

  @HiveField(8)
  final String restaurantName;

  CachedAlert({
    required this.id,
    required this.message,
    required this.date,
    required this.icon,
    required this.restaurantId,
    required this.votes,
    required this.publisherId,
    required this.restaurantPhoto,
    required this.restaurantName,
  });

  factory CachedAlert.fromAlert(AlertEntity alert) {
    return CachedAlert(
      id: alert.id,
      message: alert.message,
      date: alert.date,
      icon: alert.icon,
      restaurantId: alert.restaurantId,
      votes: alert.votes,
      publisherId: alert.publisherId,
      restaurantPhoto: alert.restaurant?.profilePhoto ?? 'assets/placeholder.png',
      restaurantName: alert.restaurant?.name ?? 'Unknown Restaurant',
    );
  }
}
