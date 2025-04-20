import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';

class DietaryTagMapper {
  static DietaryTagEntity fromJson(Map<String, dynamic> json) {
    return DietaryTagEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  static List<DietaryTagEntity> dietaryTagBackendToEntity(List<dynamic> jsonList) {
    return jsonList.map((json) => fromJson(json as Map<String, dynamic>)).toList();
  }

  static Map<String, dynamic> toJson(DietaryTagEntity dietaryTag) {
    return {
      'id': dietaryTag.id,
      'name': dietaryTag.name,
      'description': dietaryTag.description,
    };
  }
}