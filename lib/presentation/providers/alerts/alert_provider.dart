import 'package:campus_bites/data/offline/cached_alert.dart';
import 'package:campus_bites/data/offline/alerts_by_date.dart';
import 'package:campus_bites/domain/entities/alert_entity.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/presentation/providers/alerts/alert_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final getAlertsProvider = StateNotifierProvider.family<
    AlertNotifier, AsyncValue<List<AlertEntity>>, String>(
  (ref, id) {
    Future<List<AlertEntity>> getAlerts() {
      return ref.watch(alertRepositoryProvider).getAlertsByUserId(id);
    }

    Future<List<AlertEntity>> getHiveAlerts() async {
      final box = await Hive.openBox<AlertsByDate>('alerts_by_date');
      final List<AlertEntity> result = [];
      for (final item in box.values) {
        result.addAll(item.alerts.map((a) => AlertEntity(
              id: a.id,
              icon: a.icon,
              restaurantId: a.restaurantId,
              votes: a.votes,
              publisherId: a.publisherId,
              message: a.message,
              date: a.date,
              restaurant: RestaurantEntity(
                id: a.restaurantId,
                profilePhoto: a.restaurantPhoto,
                name: a.restaurantName,
                description: '',
                latitude: 0,
                longitude: 0,
                address: '',
                phone: '',
                email: '',
                routeIndications: '',
                openingTime: a.date,
                closingTime: a.date,
                rating: 0,
                opensHolidays: false,
                opensWeekends: false,
                isActive: true,
              ),
            )));
      }
      return result;
    }

    return AlertNotifier(
      fetchAlerts: getAlerts,
      fetchFromHive: getHiveAlerts,
    );
  },
);

typedef AlertCallback = Future<List<AlertEntity>> Function();

class AlertNotifier extends StateNotifier<AsyncValue<List<AlertEntity>>> {
  final AlertCallback fetchAlerts;
  final AlertCallback? fetchFromHive;

  AlertNotifier({
    required this.fetchAlerts,
    this.fetchFromHive,
  }) : super(const AsyncValue.loading()) {
    fetch();
  }

  Future<void> fetch() async {
    try {
      state = const AsyncValue.loading();
      final alerts = await fetchAlerts();
      print('Fetched alerts from backend: $alerts');

      if (alerts.isNotEmpty) {
        await _cacheAlertsToHive(alerts);
        state = AsyncValue.data(alerts);
      } else {
        final localAlerts = await fetchFromHive?.call() ?? [];
        state = AsyncValue.data(localAlerts);
      }
    } catch (e) {
      print('Error fetching alerts: $e');
      try {
        final localAlerts = await fetchFromHive?.call() ?? [];
        state = AsyncValue.data(localAlerts);
      } catch (_) {
        state = const AsyncValue.data([]);
      }
    }
  }

  Future<void> _cacheAlertsToHive(List<AlertEntity> alerts) async {
    final box = await Hive.openBox<AlertsByDate>('alerts_by_date');
    box.clear();
    final Map<DateTime, List<CachedAlert>> grouped = {};

    for (final alert in alerts) {
      final date = alert.date;
      grouped.putIfAbsent(date, () => []).add(CachedAlert.fromAlert(alert));
    }

    for (final entry in grouped.entries) {
      final item = AlertsByDate(entry.key, entry.value);
      await box.add(item);
    }
  }
}
