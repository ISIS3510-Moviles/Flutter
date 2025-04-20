import 'package:campus_bites/domain/entities/food_tag_entity.dart';

class FoodTagMapper {
  static FoodTagEntity fromJson(Map<String, dynamic> json) {
    return FoodTagEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }

  static List<FoodTagEntity> foodTagBackendToEntity(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }

  static Map<String, dynamic> toJson(FoodTagEntity foodTag) {
    return {
      'id': foodTag.id,
      'name': foodTag.name,
      'description': foodTag.description,
    };
  }
}