import 'package:campus_bites/data/datasources/comment_backend_datasource.dart';
import 'package:campus_bites/data/repositories/comment_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final commentRepositoryProvider = Provider<CommentRepositoryImpl>((ref) {
  return CommentRepositoryImpl(CommentBackendDatasource());
});