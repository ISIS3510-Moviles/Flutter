import 'package:campus_bites/presentation/providers/reservations/reservation_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider.family<bool, String>((ref, id) {
  final loading = ref.watch(getReservationsProvider(id)).isEmpty;
  return loading;
});