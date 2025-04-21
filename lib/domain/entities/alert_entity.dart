import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';

class AlertEntity {
  final String id;
  final String message;
  final DateTime date;
  final String icon;
  final String restaurantId;
  final int votes;
  final String publisherId;
  final UserEntity publisher;
  final RestaurantEntity restaurant;

  AlertEntity({
    required this.id,
    required this.message,
    required this.date,
    required this.icon,
    required this.restaurantId,
    required this.votes,
    required this.publisherId,
    required this.publisher,
    required this.restaurant,
  });
}
