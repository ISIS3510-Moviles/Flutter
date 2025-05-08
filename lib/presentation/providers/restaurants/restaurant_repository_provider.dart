import 'package:campus_bites/data/datasources/restaurant_backend_datasource.dart';
import 'package:campus_bites/data/repositories/restaurant_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final restaurantRepositoryProvider = Provider<RestaurantRepositoryImpl>((ref) {
  return RestaurantRepositoryImpl(RestaurantBackendDatasource());
});