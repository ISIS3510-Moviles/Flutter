import 'package:campus_bites/domain/entities/restaurant_entity.dart';

class GlobalRestaurant {
  static final GlobalRestaurant _instance = GlobalRestaurant._internal();

  RestaurantEntity? currentRestaurant;

  GlobalRestaurant._internal();

  factory GlobalRestaurant() {
    return _instance;
  }
}