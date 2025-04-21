import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/presentation/providers/alerts/alert_provider.dart';
import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    String userId = GlobalUser().currentUser?.id ?? '0';
    final alertsAsync = ref.watch(getAlertsProvider(userId));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            alertsAsync.when(
              data: (alerts) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final alert = alerts[index];
                      return Padding(
                        padding: const EdgeInsets.all(16),
                        child: NotificationCard(
                          imageUrl: alert.restaurant.profilePhoto ?? 'assets/placeholder.png',
                          title: alert.restaurant.name,
                          description: alert.message,
                          date:
                              DateFormat('dd/MM/yyyy HH:mm').format(alert.date),
                        ),
                      );
                    },
                    childCount: alerts.length,
                  ),
                );
              },
              loading: () => const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, st) => SliverToBoxAdapter(
                child: Center(
                    child: Text(
                        'Error loading notifications. Please try again later.')),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String description;
  final String date;

  const NotificationCard({
    super.key,
    required this.imageUrl,
    required this.title,
    required this.description,
    required this.date,
  });

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
            ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.network(
                imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 4),
                  Text(description,
                      style: TextStyle(fontSize: 16, color: Colors.grey)),
                  SizedBox(height: 4),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(),
                      Text(date,
                          style: TextStyle(fontSize: 12, color: Colors.grey)),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
