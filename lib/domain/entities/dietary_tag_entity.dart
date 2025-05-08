import 'package:campus_bites/data/offline/dietary_tag.dart';

class DietaryTagEntity {
  final String id;
  final String name;
  final String description;
  final String? icon;

  const DietaryTagEntity(
      {required this.id,
      required this.name,
      required this.description,
      this.icon});
}

extension ToDietary on DietaryTag {
  DietaryTagEntity toDietary() {
    return DietaryTagEntity(
      id: id,
      name: name,
      description: '',
      icon: icon,
    );
  }
}
