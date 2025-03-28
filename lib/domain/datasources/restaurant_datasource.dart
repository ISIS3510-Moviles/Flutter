import 'package:campus_bites/domain/entities/restaurant_entity.dart';

abstract class RestaurantDatasource {
  Future<List<RestaurantEntity>> getRestaurants();
  Future<List<RestaurantEntity>> getRestaurantsByTag(String tag);
}