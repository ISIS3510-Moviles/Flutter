import 'package:campus_bites/presentation/providers/alerts/alert_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider.family<bool, String>((ref, id) {
  final asyncAlerts = ref.watch(getAlertsProvider(id));
  return asyncAlerts.isLoading;
});
