import 'package:campus_bites/domain/entities/food_tag_entity.dart';

class FoodTagBackend {
  final String? name;
  final String? description;
  final String? icon;

  FoodTagBackend({this.name, this.description, this.icon});
}

class FoodTagMapper {
  static FoodTagEntity fromJson(Map<String, dynamic> json) {
    return FoodTagEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      icon: json['icon'] as String,
    );
  }

  static List<FoodTagEntity> foodTagBackendToEntity(List<dynamic>? foodTags) {
    if (foodTags == null) return [];
    
    return foodTags.map((tag) {
      // Make sure to handle the case where tag might not be a FoodTagBackend
      if (tag is FoodTagBackend) {
        return FoodTagEntity(
          id: tag.name ?? 'Unknown',
          name: tag.name ?? 'Unknown',
          description: tag.description ?? '',
          icon: tag.icon,
        );
      } else if (tag is Map<String, dynamic>) {
        // Handle case where it's a Map instead of FoodTagBackend object
        return FoodTagEntity(
          id: tag['id']?.toString() ?? 'Unknown',
          name: tag['name']?.toString() ?? 'Unknown',
          description: tag['description']?.toString() ?? '',
          icon: tag['icon'] as String?,
        );
      } else {
        // Return a default entity if the type is unexpected
        return FoodTagEntity(
          id: 'Unknown',
          name: 'Unknown',
          description: '',
          icon: null,
        );
      }
    }).toList();
  }

  static Map<String, dynamic> toJson(FoodTagEntity foodTag) {
    return {
      'id': foodTag.id,
      'name': foodTag.name,
      'description': foodTag.description,
    };
  }
}