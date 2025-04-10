import 'package:campus_bites/domain/entities/food_tag_entity.dart';

abstract class FoodTagRepository {
  Future<List<FoodTagEntity>> getFoodTags();
  Future<FoodTagEntity> getFoodTagById(String id);
}