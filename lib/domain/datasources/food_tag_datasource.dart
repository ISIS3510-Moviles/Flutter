import 'package:campus_bites/domain/entities/food_tag_entity.dart';

abstract class FoodTagDatasource {
  Future<List<FoodTagEntity>> getFoodTags();
  Future<FoodTagEntity> getFoodTagById(String id);
}