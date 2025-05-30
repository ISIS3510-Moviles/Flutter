import 'package:campus_bites/data/offline/queued_reservation_action.dart';
import 'package:campus_bites/data/offline/reservation_action_queue_manager.dart';
import 'package:campus_bites/domain/entities/completed_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/globals/GlobalRestaurant.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_provider_restaurant.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_repository_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar_restaurant.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReservationScreenRestaurant extends ConsumerWidget {
  const ReservationScreenRestaurant({super.key});

  Future<void> _handleRefresh(WidgetRef ref) async {
    final connectivity = await Connectivity().checkConnectivity();
    if (connectivity != ConnectivityResult.none) {
      final restaurantId = GlobalRestaurant().currentRestaurant?.id ?? '0';
      ref.invalidate(getReservationsRestaurantProvider(restaurantId));
    } else {
      ScaffoldMessenger.of(ref.context).showSnackBar(
        const SnackBar(content: Text('No internet connection.')),
      );
    }
  }

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
            return RefreshIndicator(
              onRefresh: () => _handleRefresh(ref),
              child: const CustomScrollView(
                physics: AlwaysScrollableScrollPhysics(),
                slivers: [
                  CustomSliverAppbarRestaurant(),
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          'No clients reservations found.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            );
          }

          final Map<String, List<ReservationEntity>> grouped = {};
          for (final res in reservations) {
            grouped.putIfAbsent(res.date, () => []).add(res);
          }

          final sortedKeys = grouped.keys.toList()
            ..sort((a, b) => DateTime.parse(a).compareTo(DateTime.parse(b)));

          return RefreshIndicator(
            onRefresh: () => _handleRefresh(ref),
            child: CustomScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              slivers: [
                const CustomSliverAppbar(),
                const SliverToBoxAdapter(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
                        DateFormat('EEEE, MMMM d, y').format(DateTime.parse(date)),
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
            ),
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

  bool get hasBeenCompleted =>
      CompletedState().getStatus() == reservation.state.getStatus();

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
                const Icon(Icons.date_range,
                    size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(
                  DateFormat('EEEE, MMMM d, y')
                      .format(DateTime.parse(reservation.date)),
                  style: const TextStyle(color: Color(0xFF11203A)),
                ),
              ],
            ),
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.hourglass_bottom,
                    size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(reservation.time,
                    style: const TextStyle(color: Color(0xFF11203A))),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.people, size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(
                  '${reservation.numberComensals} ${reservation.numberComensals == 1 ? 'person' : 'people'}',
                  style: const TextStyle(color: Color(0xFF11203A)),
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.info_outline,
                    size: 18, color: Color(0xFF11203A)),
                const SizedBox(width: 4),
                Text(reservation.state.getStatus(),
                    style: const TextStyle(color: Color(0xFF11203A))),
              ],
            ),

            // Mostrar botones solo si no está cancelada ni completada
            if (!hasBeenCancelled && !hasBeenCompleted) ...[
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
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
                        final connectivity =
                            await Connectivity().checkConnectivity();

                        if (connectivity == ConnectivityResult.none) {
                          await ReservationActionQueueManager().addToQueue(
                            QueuedReservationAction(
                              reservationId: reservation.id,
                              action: 'cancel',
                            ),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('No internet. Action queued.')),
                            );
                          }
                        } else {
                          try {
                            await ref
                                .read(reservationRepositoryProvider)
                                .cancelReservation(reservation.id);
                            final restaurantId =
                                GlobalRestaurant().currentRestaurant?.id ?? '0';
                            ref.invalidate(getReservationsRestaurantProvider(
                                restaurantId));

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Reservation cancelled.')),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Error cancelling reservation: $e')),
                              );
                            }
                          }
                        }
                      }
                    },
                    icon: const Icon(Icons.cancel),
                    label: const Text('Cancel'),
                  ),
                  const SizedBox(width: 8),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: () async {
                      final shouldConfirm = await showDialog<bool>(
                        context: context,
                        builder: (context) => AlertDialog(
                          title: const Text('Confirm Reservation'),
                          content: const Text(
                              'Are you sure you want to confirm this reservation?'),
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

                      if (shouldConfirm == true) {
                        final connectivity =
                            await Connectivity().checkConnectivity();

                        if (connectivity == ConnectivityResult.none) {
                          await ReservationActionQueueManager().addToQueue(
                            QueuedReservationAction(
                              reservationId: reservation.id,
                              action: 'confirm',
                            ),
                          );

                          if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('No internet. Action queued.')),
                            );
                          }
                        } else {
                          try {
                            await ref
                                .read(reservationRepositoryProvider)
                                .confirmReservation(reservation.id);
                            final restaurantId =
                                GlobalRestaurant().currentRestaurant?.id ?? '0';
                            ref.invalidate(getReservationsRestaurantProvider(
                                restaurantId));

                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Reservation confirmed.')),
                              );
                            }
                          } catch (e) {
                            if (context.mounted) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                    content: Text(
                                        'Error confirming reservation: $e')),
                              );
                            }
                          }
                        }
                      }
                    },
                    icon: const Icon(Icons.check_circle),
                    label: const Text('Confirm'),
                  ),
                ],
              ),
            ],
          ],
        ),
      ),
    );
  }
}
