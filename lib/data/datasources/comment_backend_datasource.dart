import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/comment_mapper.dart';
import 'package:campus_bites/data/models/comment_backend.dart';
import 'package:campus_bites/domain/datasources/comment_datasource.dart';
import 'package:campus_bites/domain/entities/comment_entity.dart';
import 'package:dio/dio.dart';

class CommentBackendDatasource extends CommentDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<CommentEntity> _jsonToComments(List<dynamic> json) {
    return json.map((e) => CommentMapper.commentBackendToEntity(CommentBackend.fromJson(e))).toList();
  }

  @override
  Future<List<CommentEntity>> getComments() async {
    final response = await dio.get('/comment');
    return _jsonToComments(response.data);
  }
}
