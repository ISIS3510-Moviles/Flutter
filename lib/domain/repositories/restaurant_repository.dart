import 'package:campus_bites/domain/entities/restaurant_entity.dart';

abstract class RestaurantRepository {
  Future<List<RestaurantEntity>> getRestaurants(String? nameMatch, List<String>? tagsInclude);
  Future<RestaurantEntity> getRestaurantById(String id);
}