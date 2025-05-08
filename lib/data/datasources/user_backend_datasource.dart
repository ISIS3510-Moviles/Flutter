import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/user_mapper.dart';
import 'package:campus_bites/data/models/user_backend.dart';
import 'package:campus_bites/domain/datasources/user_datasource.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';
import 'package:dio/dio.dart';

class UserBackendDatasource extends UserDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<UserEntity> _jsonToUsers(List<dynamic> json) {
    return json.map((e) => UserMapper.userBackendToEntity(UserBackend.fromJson(e))).toList();
  }

  @override
  Future<List<UserEntity>> getUsers() async {
    final response = await dio.get('/user');
    return _jsonToUsers(response.data);
  }

@override
Future<UserEntity?> getUser(String id) async {
  final response = await dio.get('/user/full/$id');
  if (response.statusCode == 200 && response.data != null) {
    try {
      final jsonData = response.data is Map<String, dynamic>
          ? response.data as Map<String, dynamic>
          : <String, dynamic>{};
      return UserMapper.userBackendToEntity(UserBackend.fromJson(jsonData));
    } catch (e) {
      print('Error parsing user JSON: $e');
      rethrow;
    }
  }
  return null;
}

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    final response = await dio.post('/user/check', data: user.toJson());
    return UserMapper.userBackendToEntity(UserBackend.fromJson(response.data));
  }



  @override
  Future<void> updateUser(UserEntity user) async {
    await dio.put('/user/${user.id}', data: user.toJson());
  }

  @override
  Future<void> deleteUser(String id) async {
    await dio.delete('/user/$id');
  }
}