import 'package:campus_bites/data/datasources/reservation_backend_datasource.dart';
import 'package:campus_bites/data/repositories/reservation_repository_impl.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final reservationRepositoryProvider = Provider<ReservationRepositoryImpl>((ref) {
  return ReservationRepositoryImpl(ReservationBackendDatasource());
});