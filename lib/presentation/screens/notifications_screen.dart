import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/domain/entities/alert_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/presentation/providers/alerts/alert_provider.dart';
import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

class NotificationsScreen extends ConsumerWidget {
  const NotificationsScreen({super.key});

  DateTime? _extractDateTime(String message) {
    final re = RegExp(r'on (\d{1,2}/\d{1,2}/\d{4}) at (\d{2}:\d{2})');
    final m = re.firstMatch(message);
    if (m == null) return null;

    final dateTimeStr = '${m.group(1)} ${m.group(2)}';
    try {
      return DateFormat('d/M/yyyy H:mm').parse(dateTimeStr);
    } catch (_) {
      return null;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final userId = GlobalUser().currentUser?.id ?? '0';
    final alertsAsync = ref.watch(getAlertsProvider(userId));

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: alertsAsync.when(
            loading: () => [
              const SliverToBoxAdapter(
                child: Center(child: CircularProgressIndicator()),
              ),
            ],
            error: (e, _) => [
              const SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Error loading notifications. Please try again later.',
                    ),
                  ),
                ),
              ),
            ],
            data: (alerts) {
              if (alerts.isEmpty) {
                return [
                  const CustomSliverAppbar(),
                  const SliverToBoxAdapter(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(24),
                        child: Text(
                          'You have no notifications.',
                          style: TextStyle(fontSize: 16, color: Colors.grey),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ];
              }

              final now = DateTime.now();
              final futureAlerts = alerts
                  .where((a) => _extractDateTime(a.message)?.isAfter(now) ?? false)
                  .toList()
                ..sort((a, b) => _extractDateTime(a.message)!
                    .compareTo(_extractDateTime(b.message)!));

              final nextReservation = futureAlerts.isNotEmpty ? futureAlerts.first : null;

              final slivers = <Widget>[const CustomSliverAppbar()];

              if (nextReservation != null) {
                final nextDate = _extractDateTime(nextReservation.message)!;

                slivers.add(
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Next reservation',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF277A46),
                            ),
                          ),
                          const SizedBox(height: 8),
                          NotificationCard(
                            imageUrl: nextReservation.restaurant?.profilePhoto ??
                                'assets/placeholder.png',
                            title: nextReservation.restaurant?.name ?? 'Restaurant not found',
                            description: nextReservation.message,
                            date: DateFormat('dd/MM/yyyy HH:mm').format(nextDate),
                          ),
                          const SizedBox(height: 24),
                          const Text(
                            'Other notifications',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF277A46),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }

              final groupedAlerts = <String, List<AlertEntity>>{};
              for (var alert in alerts) {
                final dateStr = DateFormat('dd/MM/yyyy').format(alert.date);
                groupedAlerts.putIfAbsent(dateStr, () => []).add(alert);
              }

              final sortedDates = groupedAlerts.keys.toList()
                ..sort((a, b) => DateFormat('dd/MM/yyyy')
                    .parse(b)
                    .compareTo(DateFormat('dd/MM/yyyy').parse(a)));

              for (final date in sortedDates) {
                slivers.add(
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
                      child: Text(
                        date,
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF277A46),
                        ),
                      ),
                    ),
                  ),
                );

                final alertsForDate = groupedAlerts[date]!;

                slivers.add(
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final alert = alertsForDate[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: NotificationCard(
                            imageUrl: alert.restaurant?.profilePhoto ?? 'assets/placeholder.png',
                            title: alert.restaurant?.name ?? 'Restaurant not found',
                            description: alert.message,
                            date: DateFormat('HH:mm').format(alert.date),
                          ),
                        );
                      },
                      childCount: alertsForDate.length,
                    ),
                  ),
                );
              }

              return slivers;
            },
          ),
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
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                placeholder: (context, url) => const SizedBox(
                  width: 80,
                  height: 80,
                  child: Center(child: CircularProgressIndicator(strokeWidth: 2)),
                ),
                errorWidget: (context, url, error) {
                  _analytics.logEvent(
                    name: 'image_load_error',
                    parameters: {
                      'image_url': url,
                      'error_message': error.toString(),
                      'timestamp': DateTime.now().toIso8601String(),
                    },
                  );

                  return Image.asset(
                    'assets/placeholder.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  );
                },
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4),
                  Text(description,
                      style: const TextStyle(fontSize: 16, color: Colors.grey)),
                  const SizedBox(height: 4),
                  Align(
                    alignment: Alignment.centerRight,
                    child: Text(date,
                        style:
                            const TextStyle(fontSize: 12, color: Colors.grey)),
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
