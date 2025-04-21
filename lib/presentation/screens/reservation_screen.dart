import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class ReservationScreen extends ConsumerWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = GlobalUser().currentUser?.id ?? '0';

    final reservationsAsync = ref.watch(getReservationsProvider(userId));

    return Scaffold(
      body: reservationsAsync.when(
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(
          child: Text('Error loading reservations: $error'),
        ),
        data: (reservations) => CustomScrollView(
          slivers: [
            const CustomSliverAppbar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
            reservations.isEmpty
                ? SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: Center(
                        child: Text(
                          'No reservations found.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                        ),
                      ),
                    ),
                  )
                : SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16.0),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final reservation = reservations[index];
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 12.0),
                            child: EventCard(reservation: reservation),
                          );
                        },
                        childCount: reservations.length,
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final ReservationEntity reservation;

  const EventCard({super.key, required this.reservation});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          children: [
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.date_range, size: 18, color: Color(0xFF11203A)),
                      const SizedBox(width: 4),
                      Text(
                        DateFormat('EEEE, MMMM d, y').format(DateTime.parse(reservation.date)),
                        style: TextStyle(color: Color(0xFF11203A)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.hourglass_bottom, size: 18, color: Color(0xFF11203A)),
                      const SizedBox(width: 4),
                      Text(reservation.time, style: TextStyle(color: Color(0xFF11203A))),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.people, size: 18, color: Color(0xFF11203A)),
                      const SizedBox(width: 4),
                      Text(reservation.numberComensals.toString(), style: TextStyle(color: Color(0xFF11203A))),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.info_outline, size: 18, color: Color(0xFF11203A)),
                      const SizedBox(width: 4),
                      Text(reservation.state.getStatus(), style: TextStyle(color: Color(0xFF11203A))),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
