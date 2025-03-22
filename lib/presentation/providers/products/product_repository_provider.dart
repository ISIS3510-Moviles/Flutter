import 'package:campus_bites/data/datasources/product_backend_datasource.dart';
import 'package:campus_bites/data/repositories/product_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final productRepositoryProvider = Provider<ProductRepositoryImpl>((ref) {
  return ProductRepositoryImpl(ProductBackendDatasource());
});