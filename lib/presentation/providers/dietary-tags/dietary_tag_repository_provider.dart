import 'package:campus_bites/data/datasources/dietary_tag_backend_datasource.dart';
import 'package:campus_bites/data/repositories/dietary_tag_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dietaryTagRepositoryProvider = Provider<DietaryTagRepositoryImpl>((ref) {
  return DietaryTagRepositoryImpl(DietaryTagBackendDatasource());
});