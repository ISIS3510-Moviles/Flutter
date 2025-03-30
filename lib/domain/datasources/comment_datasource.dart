import 'package:campus_bites/domain/entities/comment_entity.dart';

abstract class CommentDatasource {
  Future<List<CommentEntity>> getComments();
}
