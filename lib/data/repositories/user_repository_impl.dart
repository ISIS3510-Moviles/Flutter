import 'package:campus_bites/data/datasources/user_backend_datasource.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';
import 'package:campus_bites/domain/repositories/user_repository.dart';

class UserRepositoryImpl extends UserRepository {
  final UserBackendDatasource datasource;

  UserRepositoryImpl(this.datasource);

  @override
  Future<UserEntity?> getUser(String document) async {
    return datasource.getUser(document);
  }

  @override
  Future<List<UserEntity>> getAllUsers() async {
    return datasource.getUsers();
  }

  @override
  Future<UserEntity> createUser(UserEntity user) async {
    return datasource.createUser(user);
  }

  @override
  Future<void> updateUser(UserEntity user) async {
    await datasource.updateUser(user);
  }

  @override
  Future<void> deleteUser(String id) async {
    await datasource.deleteUser(id);
  }
}