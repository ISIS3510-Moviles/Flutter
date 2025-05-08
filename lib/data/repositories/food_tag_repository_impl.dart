import 'package:campus_bites/data/datasources/food_tag_backend_datasource.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/domain/repositories/food_tag_repository.dart';

class FoodTagRepositoryImpl extends FoodTagRepository {
  final FoodTagBackendDatasource foodTagBackendDatasource;

  FoodTagRepositoryImpl(this.foodTagBackendDatasource);

  @override
  Future<List<FoodTagEntity>> getFoodTags() async {
    try {
      return await foodTagBackendDatasource.getFoodTags();
    } catch (e) {
      throw Exception('Error fetching food tags: $e');
    }
  }

  @override
  Future<FoodTagEntity> getFoodTagById(String id) async {
    try {
      final backendTag = await foodTagBackendDatasource.getFoodTagById(id);
      return backendTag;
    } catch (e) {
      throw Exception('Error fetching food tag by ID: $e');
    }
  }
}