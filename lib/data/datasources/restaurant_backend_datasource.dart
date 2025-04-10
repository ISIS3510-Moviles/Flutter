import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/domain/datasources/restaurant_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:dio/dio.dart';

class RestaurantBackendDatasource extends RestaurantDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<RestaurantEntity> _jsonToRestaurants(List<dynamic> json) {
    return json.map((e) => RestaurantMapper.restaurantBackendToEntity(RestaurantBackend.fromJson(e))).toList();
  }

  List<Map<String, dynamic>> _jsonToRestaurantCards(List<dynamic> json) {
    final restaurants = _jsonToRestaurants(json);
    return RestaurantMapper.mapEntitiesToRestaurantCards(restaurants);
  }

  @override
  Future<List<RestaurantEntity>> getRestaurants() async {
    final response = await dio.get('/restaurant/tags');
    return _jsonToRestaurants(response.data);
  }

  @override
  Future<Map<String, dynamic>> getRestaurantsByTag(String tagId) async {
    final response = await dio.get('/restaurant/by-food-tag/$tagId');
    final data = response.data;

    final tagName = data['tagName'] as String;
    final restaurants = _jsonToRestaurantCards(data['restaurants'] as List<dynamic>);

    return {
      'tagName': tagName,
      'restaurants': restaurants,
    };
  }
}