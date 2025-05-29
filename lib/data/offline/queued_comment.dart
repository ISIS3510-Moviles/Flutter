import 'package:hive/hive.dart';

part 'queued_comment.g.dart';

@HiveType(typeId: 0)
class QueuedComment extends HiveObject {
  @HiveField(0)
  String message;

  @HiveField(1)
  double rating;

  @HiveField(2)
  String productId;

  @HiveField(3)
  String restaurantId;

  @HiveField(4)
  String authorId;

  @HiveField(5)
  List<String> photos;

  @HiveField(6)
  DateTime createdAt;

  QueuedComment({
    required this.message,
    required this.rating,
    required this.productId,
    required this.restaurantId,
    required this.authorId,
    required this.photos,
    required this.createdAt,
  });
}
