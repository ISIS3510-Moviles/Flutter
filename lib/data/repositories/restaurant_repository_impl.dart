import 'package:campus_bites/data/datasources/restaurant_backend_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantBackendDatasource restaurantBackendDatasource;

  RestaurantRepositoryImpl(this.restaurantBackendDatasource);
  
  @override
  Future<List<RestaurantEntity>> getRestaurants(String? nameMatch, List<String>? tagsInclude) async {
    try {
      return await restaurantBackendDatasource.getRestaurants(nameMatch, tagsInclude);
    } catch (e) {
      throw Exception('Error fetching restaurants: $e');
    }
  }

  @override
  Future<RestaurantEntity> getRestaurantById(String id) async {
    try {
      return await restaurantBackendDatasource.getRestaurantById(id);
    } catch (e) {
      throw Exception('Error fetching restaurant by ID: $e');
    }
  }

  Future<List<RestaurantEntity>> getRestaurantsByTag(String tagName) async {
    try {
      return await restaurantBackendDatasource.getRestaurantsByTag(tagName);
    } catch (e) {
      throw Exception('Error fetching restaurants by tag: $e');
    }
  }

}