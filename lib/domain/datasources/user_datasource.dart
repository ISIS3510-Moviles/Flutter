import 'package:campus_bites/domain/entities/user_entity.dart';

abstract class UserDatasource {
  Future<UserEntity?> getUser(String id);
  Future<List<UserEntity>> getUsers();
  Future<UserEntity> createUser(UserEntity user);
  Future<void> updateUser(UserEntity user);
  Future<void> deleteUser(String id);
}