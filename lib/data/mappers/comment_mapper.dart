import 'package:campus_bites/data/models/comment_backend.dart';
import 'package:campus_bites/domain/entities/comment_entity.dart';

class CommentMapper {
  static CommentEntity commentBackendToEntity(CommentBackend commentBackend) {
    return CommentEntity(
      id: commentBackend.id,
      datetime: commentBackend.datetime,
      message: commentBackend.message,
      rating: commentBackend.rating,
      likes: commentBackend.likes,
      isVisible: commentBackend.isVisible,
      authorId: commentBackend.authorId,
      authorName: commentBackend.authorName
    );
  }
}
