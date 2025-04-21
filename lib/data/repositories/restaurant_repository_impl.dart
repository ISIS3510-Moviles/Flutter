import 'package:campus_bites/data/datasources/restaurant_backend_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantBackendDatasource restaurantBackendDatasource;

  RestaurantRepositoryImpl(this.restaurantBackendDatasource);
  
  @override
  Future<List<RestaurantEntity>> getRestaurants(String? nameMatch, List<String>? tagsInclude) {
    return restaurantBackendDatasource.getRestaurants(nameMatch, tagsInclude);
  }

  @override
  Future<RestaurantEntity> getRestaurantById(String id) {
    return restaurantBackendDatasource.getRestaurantById(id);
  }


  @override
  Future<List<RestaurantEntity>> getRestaurantsByTag(String tagName) {
    return restaurantBackendDatasource.getRestaurantsByTag(tagName);
  }

}