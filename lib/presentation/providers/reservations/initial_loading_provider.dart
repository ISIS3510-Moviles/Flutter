
import 'package:campus_bites/presentation/providers/reservations/reservation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final loading = ref.watch(getReservationsProvider).isEmpty;
  return loading;
});