import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/dietary_tag_mapper.dart';
import 'package:campus_bites/domain/datasources/dietary_tag_datasource.dart';
import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:dio/dio.dart';

class DietaryTagBackendDatasource extends DietaryTagDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<DietaryTagEntity> _jsonToDietaryTags(List<dynamic> json) {
    return DietaryTagMapper.dietaryTagBackendToEntity(json);
  }

@override
Future<List<DietaryTagEntity>> getDietaryTags() async {
  try {
    final response = await dio.get('/dietary-tag');
    final tags = _jsonToDietaryTags(response.data);
    return tags;
  } catch (e) {
    throw Exception('Error fetching dietary tags');
  }
}
  
@override
Future<DietaryTagEntity> getDietaryTagById(String id) async {
  try {
    final response = await dio.get('/dietary-tag/$id');
    final data = response.data as Map<String, dynamic>;
    return DietaryTagMapper.fromJson(data);
  } catch (e) {
    throw Exception('Error fetching dietary tag by ID: $e');
  }
}
}
