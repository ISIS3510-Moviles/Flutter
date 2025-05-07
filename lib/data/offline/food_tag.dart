import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:hive/hive.dart';

part 'food_tag.g.dart';

@HiveType(typeId: 2)
class FoodTag extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String icon;

  FoodTag({
    required this.id,
    required this.name,
    required this.icon,
  });
}

extension ToHiveFood on FoodTagEntity {
  FoodTag toHiveFoodModel() {
    return FoodTag(
      id: id,
      name: name,
      icon: icon ?? 'assets/placeholder.png',
    );
  }
}

