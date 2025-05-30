import 'package:campus_bites/data/offline/cached_reservation.dart';
import 'package:campus_bites/data/offline/reservations_by_date.dart';
import 'package:campus_bites/domain/entities/completed_state.dart';
import 'package:campus_bites/domain/entities/pending_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final getReservationsProvider = StateNotifierProvider.family<
    ReservationNotifier, AsyncValue<List<ReservationEntity>>, String>(
  (ref, id) {
    Future<List<ReservationEntity>> getReservations() {
      return ref
          .watch(reservationRepositoryProvider)
          .getReservationsByUserId(id);
    }

    Future<List<ReservationEntity>> getHiveReservations() async {
      final box =
          await Hive.openBox<ReservationsByDate>('reservations_by_date');
      final List<ReservationEntity> result = [];
      for (final item in box.values) {
        result.addAll(item.reservations.map((q) => ReservationEntity(
              id: q.id,
              date: q.date,
              time: q.time,
              numberComensals: q.numberComensals,
              state: q.isCompleted ? CompletedState() : PendingState(),
            )));
      }
      return result;
    }

    return ReservationNotifier(
      fetchReservations: getReservations,
      fetchFromHive: getHiveReservations,
    );
  },
);

typedef ReservationCallback = Future<List<ReservationEntity>> Function();

class ReservationNotifier
    extends StateNotifier<AsyncValue<List<ReservationEntity>>> {
  final ReservationCallback fetchReservations;
  final ReservationCallback? fetchFromHive;

  ReservationNotifier({
    required this.fetchReservations,
    this.fetchFromHive,
  }) : super(const AsyncValue.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    try {
      state = const AsyncValue.loading();
      final reservations = await fetchReservations();
      print('Fetched from backend: $reservations');

      if (reservations.isNotEmpty) {
        await _cacheReservationsToHive(reservations);
        state = AsyncValue.data(reservations);
      } else {
        final localReservations = await fetchFromHive?.call() ?? [];
        state = AsyncValue.data(localReservations);
      }
    } catch (e) {
      print('Error fetching reservations: $e');
      try {
        final localReservations = await fetchFromHive?.call() ?? [];
        state = AsyncValue.data(localReservations);
      } catch (_) {
        state = const AsyncValue.data([]);
      }
    }
  }

  Future<void> _cacheReservationsToHive(
      List<ReservationEntity> reservations) async {
    final box = await Hive.openBox<ReservationsByDate>('reservations_by_date');
    box.clear();
    final Map<DateTime, List<CachedReservation>> grouped = {};

    for (final res in reservations) {
      final date =
          DateTime.parse(res.date);
      grouped
          .putIfAbsent(date, () => [])
          .add(CachedReservation.fromReservation(res));
    }

    for (final entry in grouped.entries) {
      final item = ReservationsByDate(entry.key, entry.value);
      await box.add(item);
    }
  }
}
