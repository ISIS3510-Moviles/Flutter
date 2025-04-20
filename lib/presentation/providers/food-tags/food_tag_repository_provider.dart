import 'package:campus_bites/data/datasources/food_tag_backend_datasource.dart';
import 'package:campus_bites/data/repositories/food_tag_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final foodTagRepositoryProvider = Provider<FoodTagRepositoryImpl>((ref) {
  return FoodTagRepositoryImpl(FoodTagBackendDatasource());
});