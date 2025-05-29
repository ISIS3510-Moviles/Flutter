import 'package:campus_bites/data/offline/food_tag.dart';

class FoodTagEntity {
  final String id;
  final String name;
  final String description;
  final String? icon;

  const FoodTagEntity({
    required this.id,
    required this.name,
    required this.description, 
    this.icon
  });
}

extension ToFood on FoodTag {
  FoodTagEntity toFood() {
    return FoodTagEntity(
      id: id,
      name: name,
      description: '',
      icon: icon,
    );
  }
}