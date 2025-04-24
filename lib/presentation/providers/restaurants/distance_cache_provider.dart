import 'package:flutter_riverpod/flutter_riverpod.dart';

final distanceCacheProvider =
    StateNotifierProvider<DistanceCacheNotifier, Map<String, double>>(
  (ref) => DistanceCacheNotifier(),
);

class DistanceCacheNotifier extends StateNotifier<Map<String, double>> {
  DistanceCacheNotifier() : super({});

  void setDistance(String restaurantId, double distanceMeters) {
    state = {...state, restaurantId: distanceMeters};
  }

  double? getDistance(String restaurantId) {
    return state[restaurantId];
  }
}
