import 'package:campus_bites/domain/entities/restaurant_entity.dart';

abstract class RestaurantDatasource {
  Future<List<RestaurantEntity>> getRestaurants(
      String? searchMath, List<String>? tagsInclude);
  Future<RestaurantEntity> getRestaurantById(String tagId);
  Future<RestaurantEntity> createRestaurant(RestaurantEntity restaurant);
}
