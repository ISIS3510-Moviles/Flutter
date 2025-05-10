import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/food_tag_mapper.dart';
import 'package:campus_bites/domain/datasources/food_tag_datasource.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:dio/dio.dart';

class FoodTagBackendDatasource extends FoodTagDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<FoodTagEntity> _jsonToFoodTags(List<dynamic> json) {
    return FoodTagMapper.foodTagBackendToEntity(json);
  }

@override
Future<List<FoodTagEntity>> getFoodTags() async {
  try {
    final response = await dio.get('/food-tag');
    final tags = _jsonToFoodTags(response.data);
    return tags;
  } catch (e) {
    print('Error fetching food tags: $e');
    throw Exception('Error fetching food tags');
  }
}
  
@override
Future<FoodTagEntity> getFoodTagById(String id) async {
  try {
    final response = await dio.get('/food-tag/$id');
    final data = response.data as Map<String, dynamic>;
    return FoodTagMapper.fromJson(data);
  } catch (e) {
    throw Exception('Error fetching food tag by ID: $e');
  }
}
}
