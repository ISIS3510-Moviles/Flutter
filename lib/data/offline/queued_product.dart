import 'package:hive/hive.dart';

part 'queued_product.g.dart';

@HiveType(typeId: 16)
class QueuedProduct extends HiveObject {
  @HiveField(0)
  final String photoUrl;

  @HiveField(1)
  final String name;

  @HiveField(2)
  final String description;

  @HiveField(3)
  final double price;

  @HiveField(4)
  final List<String> ingredients;

  @HiveField(5)
  final List<String> tags;

  QueuedProduct({
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.ingredients,
    required this.tags,
  });
}
