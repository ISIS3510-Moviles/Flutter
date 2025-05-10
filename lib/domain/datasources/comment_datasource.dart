import 'package:campus_bites/domain/entities/comment_entity.dart';

abstract class CommentDatasource {
  Future<List<CommentEntity>> getComments();
  Future<String> createComment({
    required String message,
    required double rating,
    required List<String> photos,
    required String productId,
    required String restaurantId,
    required String authorId,
    bool isVisible = true,
    int likes = 0,
    DateTime? datetime,
  });
}