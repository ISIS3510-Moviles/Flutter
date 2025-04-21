import 'package:campus_bites/domain/entities/alert_entity.dart';
import 'package:campus_bites/presentation/providers/alerts/alert_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAlertsProvider = StateNotifierProvider.family<
    AlertNotifier,
    AsyncValue<List<AlertEntity>>,
    String>(
  (ref, id) {
    final getAlerts = () => ref.watch(alertRepositoryProvider).getAlertsByUserId(id);
    return AlertNotifier(fetchAlerts: getAlerts);
  },
);

typedef AlertCallback = Future<List<AlertEntity>> Function();

class AlertNotifier extends StateNotifier<AsyncValue<List<AlertEntity>>> {
  final AlertCallback fetchAlerts;

  AlertNotifier({
    required this.fetchAlerts,
  }) : super(const AsyncValue.loading()) {
    fetch(); 
  }

  Future<void> fetch() async {
    try {
      state = const AsyncValue.loading();
      final List<AlertEntity> alerts = await fetchAlerts();
      state = AsyncValue.data(alerts);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}
