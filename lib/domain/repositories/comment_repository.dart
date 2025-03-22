import 'package:campus_bites/domain/entities/comment_entity.dart';

abstract class CommentRepository {
  Future<List<CommentEntity>> getComments();
}
