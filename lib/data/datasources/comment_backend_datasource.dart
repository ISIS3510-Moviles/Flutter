import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/comment_mapper.dart';
import 'package:campus_bites/data/models/comment_backend.dart';
import 'package:campus_bites/domain/datasources/comment_datasource.dart';
import 'package:campus_bites/domain/entities/comment_entity.dart';
import 'package:dio/dio.dart';
import 'package:campus_bites/globals/lru_cache_delete_old_restaurant.dart';

class CommentBackendDatasource extends CommentDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<CommentEntity> _jsonToComments(List<dynamic> json) {
    return json
        .map((e) =>
            CommentMapper.commentBackendToEntity(CommentBackend.fromJson(e)))
        .toList();
  }

  @override
  Future<List<CommentEntity>> getComments() async {
    final response = await dio.get('/comment');
    return _jsonToComments(response.data);
  }

  @override
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
  }) async {
    try {
      final requestBody = {
        "message": message,
        "rating": rating,
        "likes": likes,
        "isVisible": isVisible,
        "photos": photos,
        "productId": productId,
        "datetime": (datetime ?? DateTime.now()).toUtc().toIso8601String(),
        "restaurantId": restaurantId,
        "authorId": authorId,
      };
      final response = await dio.post(
        '/comment',
        data: requestBody,
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        LruCacheDeleteOldRestaurant.instance.invalidate(restaurantId);
        return response.data['id'];
      } else {
        throw Exception('Failed to create comment: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating comment: $e');
    }
  }
}