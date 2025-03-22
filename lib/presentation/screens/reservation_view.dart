import 'package:campus_bites/domain/entities/pending_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';

class ReservationScreen extends StatelessWidget {
  const ReservationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppbar(),
          SliverToBoxAdapter(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
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
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 12.0),
                    child: EventCard(),
                  );
                },
                childCount: 10,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EventCard extends StatelessWidget {
  final ReservationEntity reservation = ReservationEntity(
    id: '1',
    date: '2023-10-15',
    time: '19:00',
    numberComensals: 4,
    state: PendingState(),
  );

  EventCard({super.key});

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
                      Icon(
                        Icons.date_range,
                        size: 18,
                        color: Color(0xFF11203A),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        reservation.date,
                        style: TextStyle(color: Color(0xFF11203A)),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        Icons.hourglass_bottom,
                        size: 18,
                        color: Color(0xFF11203A),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        reservation.time,
                        style: TextStyle(color: Color(0xFF11203A)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 18,
                        color: Color(0xFF11203A),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        reservation.numberComensals.toString(),
                        style: TextStyle(color: Color(0xFF11203A)),
                      ),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 18,
                        color: Color(0xFF11203A),
                      ),
                      const SizedBox(width: 4),
                      Text(
                        reservation.state.getStatus(),
                        style: TextStyle(color: Color(0xFF11203A)),
                      ),
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
