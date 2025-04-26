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

  QueuedComment({
    required this.message,
    required this.rating,
    required this.productId,
    required this.restaurantId,
    required this.authorId,
  });
}
