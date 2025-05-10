import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/data/models/user_backend.dart';

class AlertBackend {
  final String id;
  final String message;
  final DateTime date;
  final String icon;
  final String restaurantId;
  final int votes;
  final String publisherId;
  final UserBackend publisher;
  final RestaurantBackend restaurant;

  AlertBackend({
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

  factory AlertBackend.fromJson(Map<String, dynamic> json) {
    return AlertBackend(
      id: json['id'] as String? ?? '',
      message: json['message'] as String? ?? '',
      date: DateTime.parse(json['date'] as String? ?? ''),
      icon: json['icon'] as String? ?? '',
      restaurantId: json['restaurantId'] as String? ?? '',
      votes: json['votes'] as int? ?? 0,
      publisherId: json['publisherId'] as String? ?? '',
      publisher: UserBackend.fromJson(json['publisher'] as Map<String, dynamic>? ?? {}),
      restaurant: RestaurantBackend.fromJson(json['restaurant'] as Map<String, dynamic>? ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'message': message,
      'date': date.toIso8601String(),
      'icon': icon,
      'restaurantId': restaurantId,
      'votes': votes,
      'publisherId': publisherId,
      'publisher': publisher.toJson(),
      'restaurant': restaurant,
    };
  }
}