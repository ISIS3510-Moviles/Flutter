import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getReservationsProvider = StateNotifierProvider<ReservationNotifier, List<ReservationEntity>>((ref) {
  final getReservations = ref.watch(reservationRepositoryProvider).getReservations;

  return ReservationNotifier(fetchReservations: getReservations);
});

typedef ReservationCallback = Future<List<ReservationEntity>> Function();

class ReservationNotifier extends StateNotifier<List<ReservationEntity>> {
  ReservationCallback fetchReservations;

  ReservationNotifier({
    required this.fetchReservations
  }) : super([]);

  Future<void> fetch() async {
    final List<ReservationEntity> reservations = await fetchReservations();
    state = reservations;
  }
}