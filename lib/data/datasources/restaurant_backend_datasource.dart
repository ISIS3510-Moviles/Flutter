import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/domain/datasources/restaurant_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:dio/dio.dart';

class RestaurantBackendDatasource extends RestaurantDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<RestaurantEntity> _jasonToRestaurants(List<dynamic> json) {
    return json.map((e) => RestaurantMapper.restaurantBackendToEntity(RestaurantBackend.fromJson(e))).toList();
  }

  @override
  Future<List<RestaurantEntity>> getRestaurants() async {
    final response = await dio.get('/restaurant');
    return _jasonToRestaurants(response.data);
  }

  @override
  Future<List<RestaurantEntity>> getRestaurantsByTag(String tag) async {
    var response = await getRestaurants();
    response = response
        .where((restaurant) => restaurant.foodTagsIds?.contains(tag) ?? false)
        .toList();
    return response;
  }
}