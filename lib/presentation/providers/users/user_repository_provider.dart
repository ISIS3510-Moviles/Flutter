import 'package:campus_bites/data/datasources/user_backend_datasource.dart';
import 'package:campus_bites/data/repositories/user_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final userRepositoryProvider = Provider<UserRepositoryImpl>((ref) {
  return UserRepositoryImpl(UserBackendDatasource());
});