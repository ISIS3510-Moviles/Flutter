import 'package:campus_bites/data/datasources/alert_backend_datasource.dart';
import 'package:campus_bites/data/repositories/alert_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final alertRepositoryProvider = Provider<AlertRepositoryImpl>((ref) {
  return AlertRepositoryImpl(AlertBackendDatasource());
});