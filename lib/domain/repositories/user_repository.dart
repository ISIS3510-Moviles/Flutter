import 'package:campus_bites/domain/entities/user_entity.dart';

abstract class UserRepository {

  Future<UserEntity?> getUser(String document);


  Future<List<UserEntity>> getAllUsers();


  Future<void> createUser(UserEntity user);


  Future<void> updateUser(UserEntity user);


  Future<void> deleteUser(String id);
}