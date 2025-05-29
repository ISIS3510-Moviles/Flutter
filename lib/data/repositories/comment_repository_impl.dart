import 'package:campus_bites/data/datasources/comment_backend_datasource.dart';
import 'package:campus_bites/domain/entities/comment_entity.dart';
import 'package:campus_bites/domain/repositories/comment_repository.dart';

class CommentRepositoryImpl extends CommentRepository {
  final CommentBackendDatasource commentBackendDatasource;

  CommentRepositoryImpl(this.commentBackendDatasource);
  
  @override
  Future<List<CommentEntity>> getComments() async {
    try {
      return await commentBackendDatasource.getComments();
    } catch (e) {
      throw Exception('Error fetching comments: $e');
    }
  }
}
