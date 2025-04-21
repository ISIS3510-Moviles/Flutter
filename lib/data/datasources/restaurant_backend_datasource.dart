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


@override
Future<List<RestaurantEntity>> getRestaurants(String? searchMatch, List<String>? tagsInclude) async {
  final queryParams = <String, dynamic>{};

  if (searchMatch != null) {
    queryParams['nameMatch'] = searchMatch;
  }

  if (tagsInclude != null && tagsInclude.isNotEmpty) {
    queryParams['tagsInclude'] = tagsInclude;
  }

  final response = await dio.get(
    '/restaurant/tags',
    queryParameters: queryParams,
  );

  return _jsonToRestaurants(response.data);
}


  @override
  Future<List<RestaurantEntity>> getRestaurantsByTag(String tagId) async {
    final response = await dio.get('/restaurant/by-food-tag/$tagId');
    final data = response.data;
    final restaurants = _jsonToRestaurants(data['restaurants']);
    return restaurants;
  }

@override
Future<RestaurantEntity> getRestaurantById(String id) async {
  final response = await dio.get('/restaurant/full/$id');
  final data = response.data;
  final restaurantBackend = RestaurantBackend.fromJson(data);
  final restaurant = RestaurantMapper.restaurantBackendToEntity(restaurantBackend);
  return restaurant;
}
}