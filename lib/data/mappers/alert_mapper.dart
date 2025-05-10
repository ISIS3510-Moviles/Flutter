import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/data/models/alert_backend.dart';
import 'package:campus_bites/data/mappers/user_mapper.dart';
import 'package:campus_bites/domain/entities/alert_entity.dart';

class AlertMapper {
  static AlertEntity alertBackendToEntity(AlertBackend alertBackend) {
    return AlertEntity(
      id: alertBackend.id,
      message: alertBackend.message,
      date: alertBackend.date,
      icon: alertBackend.icon,
      restaurantId: alertBackend.restaurantId,
      votes: alertBackend.votes,
      publisherId: alertBackend.publisherId,
      publisher: UserMapper.userBackendToEntity(alertBackend.publisher),
      restaurant: RestaurantMapper.restaurantBackendToEntity(alertBackend.restaurant),
    );
  }
}