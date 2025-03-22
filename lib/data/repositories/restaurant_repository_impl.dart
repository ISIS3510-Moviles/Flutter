import 'package:campus_bites/data/datasources/restaurant_backend_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/domain/repositories/restaurant_repository.dart';

class RestaurantRepositoryImpl extends RestaurantRepository {
  final RestaurantBackendDatasource restaurantBackendDatasource;

  RestaurantRepositoryImpl(this.restaurantBackendDatasource);
  
  @override
  Future<List<RestaurantEntity>> getRestaurants() {
    return restaurantBackendDatasource.getRestaurants();
  }

}