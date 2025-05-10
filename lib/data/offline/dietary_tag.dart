import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:hive/hive.dart';

part 'dietary_tag.g.dart';

@HiveType(typeId: 3)
class DietaryTag extends HiveObject {
  @HiveField(0)
  String id;

  @HiveField(1)
  String name;

  @HiveField(2)
  String icon;

  DietaryTag({
    required this.id,
    required this.name,
    required this.icon,
  });
}

extension ToHiveDietary on DietaryTagEntity {
  DietaryTag toHiveDietaryModel() {
    return DietaryTag(
      id: id,
      name: name,
      icon: icon ?? 'assets/placeholder.png',
    );
  }
}

