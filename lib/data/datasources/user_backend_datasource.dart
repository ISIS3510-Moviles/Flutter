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
    print('/user/full/$id');
    print(response);
    print(response.data);
    print(UserBackend.fromJson(response.data));
    print(UserMapper.userBackendToEntity(UserBackend.fromJson(response.data)));
    if (response.statusCode == 200 && response.data != null) {
      return UserMapper.userBackendToEntity(UserBackend.fromJson(response.data));
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