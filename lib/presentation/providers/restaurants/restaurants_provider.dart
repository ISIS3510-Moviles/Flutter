import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurant_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRestaurantsProvider = StateNotifierProvider<RestaurantNotifier, List<RestaurantEntity>>((ref) {
  final getRestaurants = ref.watch(restaurantRepositoryProvider).getRestaurants;

  return RestaurantNotifier(fetchRestaurants: getRestaurants);
});

typedef RestaurantCallback = Future<List<RestaurantEntity>> Function();

class RestaurantNotifier extends StateNotifier<List<RestaurantEntity>> {
  RestaurantCallback fetchRestaurants;

  RestaurantNotifier({
    required this.fetchRestaurants
  }) : super([]);

  Future<void> fetch() async {
    final List<RestaurantEntity> restaurants = await fetchRestaurants();
    state = restaurants;
  }
}