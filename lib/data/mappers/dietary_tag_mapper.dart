import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';

class DietaryTagBackend {
  final String? name;
  final String? description;

  DietaryTagBackend({this.name, this.description});
}

class DietaryTagMapper {
  static DietaryTagEntity fromJson(Map<String, dynamic> json) {
    return DietaryTagEntity(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  static List<DietaryTagEntity> dietaryTagBackendToEntity(List<dynamic>? dietaryTags) {
    if (dietaryTags == null) return [];
    
    return dietaryTags.map((tag) {
      if (tag is DietaryTagBackend) {
        return DietaryTagEntity(
          id: tag.name ?? 'Unknown',
          name: tag.name ?? 'Unknown',
          description: tag.description ?? '',
        );
      } else if (tag is Map<String, dynamic>) {
        return DietaryTagEntity(
          id: tag['id']?.toString() ?? 'Unknown',
          name: tag['name']?.toString() ?? 'Unknown',
          description: tag['description']?.toString() ?? '',
        );
      } else {
        return DietaryTagEntity(
          id: 'Unknown',
          name: 'Unknown',
          description: '',
        );
      }
    }).toList();
  }

  static Map<String, dynamic> toJson(DietaryTagEntity dietaryTag) {
    return {
      'id': dietaryTag.id,
      'name': dietaryTag.name,
      'description': dietaryTag.description,
    };
  }
}