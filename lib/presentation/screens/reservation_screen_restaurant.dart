import 'package:campus_bites/domain/entities/completed_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/globals/GlobalRestaurant.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_provider_restaurant.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_repository_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReservationScreenRestaurant extends ConsumerWidget {
  const ReservationScreenRestaurant({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final restaurantId = GlobalRestaurant().currentRestaurant?.id ?? '0';
    final reservationsAsync =
        ref.watch(getReservationsRestaurantProvider(restaurantId));

    return Scaffold(
      body: reservationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error loading reservations: $error'),
        ),
        data: (reservations) {
          if (reservations.isEmpty) {
            return CustomScrollView(
              slivers: [
                const CustomSliverAppbarRestaurant(),
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text(
                        'No clients reservations found.',
                        style: TextStyle(fontSize: 16, color: Colors.grey),
                      ),
                    ),
                  ),
                ),
              ],
            );
          }

          final Map<String, List<ReservationEntity>> grouped = {};
          for (final res in reservations) {
            grouped.putIfAbsent(res.date, () => []).add(res);
          }

          final sortedKeys = grouped.keys.toList()
            ..sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));

          return CustomScrollView(
            slivers: [
              const CustomSliverAppbar(),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 16.0, vertical: 12.0),
                  child: Text(
                    'Upcoming reservations',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF277A46),
                    ),
                  ),
                ),
              ),
              for (final date in sortedKeys) ...[
                SliverToBoxAdapter(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Text(
                      DateFormat('EEEE, MMMM d, y')
                          .format(DateTime.parse(date)),
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF11203A),
                      ),
                    ),
                  ),
                ),
                SliverPadding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final reservation = grouped[date]![index];
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: EventCard(reservation: reservation),
                        );
                      },
                      childCount: grouped[date]!.length,
                    ),
                  ),
                ),
              ]
            ],
          );
        },
      ),
    );
  }
}

class EventCard extends ConsumerWidget {
  final ReservationEntity reservation;

  const EventCard({super.key, required this.reservation});

  bool get hasBeenCancelled => reservation.hasBeenCancelled;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.date_range, size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(
                  DateFormat('EEEE, MMMM d, y')
                      .format(DateTime.parse(reservation.date)),
                  style: TextStyle(color: Color(0xFF11203A)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                Icon(Icons.hourglass_bottom,
                    size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(reservation.time,
                    style: TextStyle(color: Color(0xFF11203A))),
              ],
            ),
            Row(
              children: [
                Icon(Icons.people, size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(
                  '${reservation.numberComensals} ${reservation.numberComensals == 1 ? 'person' : 'people'}',
                  style: TextStyle(color: Color(0xFF11203A)),
                ),
              ],
            ),
            Row(
              children: [
                Icon(Icons.info_outline, size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(reservation.state.getStatus(),
                    style: TextStyle(color: Color(0xFF11203A))),
              ],
            ),
            if (!hasBeenCancelled) ...[
              const SizedBox(height: 12),
              Align(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8)),
                  ),
                  onPressed: () async {
                    final shouldCancel = await showDialog<bool>(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Cancel Reservation'),
                        content: const Text(
                            'Are you sure you want to cancel this reservation?'),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(false),
                            child: const Text('No'),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text('Yes'),
                          ),
                        ],
                      ),
                    );

                    if (shouldCancel == true) {
                      try {
                        await ref
                            .read(reservationRepositoryProvider)
                            .cancelReservation(reservation.id);

                        final restaurantId =
                            GlobalRestaurant().currentRestaurant?.id ?? '0';
                        ref.invalidate(
                            getReservationsRestaurantProvider(restaurantId));

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                              content: Text('Reservation cancelled.')),
                        );
                      } catch (e) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                              content:
                                  Text('Error cancelling reservation: $e')),
                        );
                      }
                    }
                  },
                  icon: const Icon(Icons.cancel),
                  label: const Text('Cancel'),
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
