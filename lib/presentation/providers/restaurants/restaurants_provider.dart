import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurant_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRestaurantsProvider = StateNotifierProvider<RestaurantNotifier, List<RestaurantEntity>>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);

  return RestaurantNotifier(
    fetchRestaurants: repository.getRestaurants,
    fetchRestaurantsByTag: repository.getRestaurantsByTag,
  );
});

typedef RestaurantCallback = Future<List<RestaurantEntity>> Function(String? nameMatch, List<String>? tagsInclude);
typedef RestaurantByTagCallback = Future<List<RestaurantEntity>> Function(String tagId);

class RestaurantNotifier extends StateNotifier<List<RestaurantEntity>> {
  final RestaurantCallback fetchRestaurants;
  final RestaurantByTagCallback fetchRestaurantsByTag;

  RestaurantNotifier({
    required this.fetchRestaurants,
    required this.fetchRestaurantsByTag,
  }) : super([]);

  Future<void> fetch({String? nameMatch, List<String>? tagsInclude}) async {
    try {
      final restaurants = await fetchRestaurants(nameMatch, tagsInclude);
      state = restaurants;
    } catch (e) {
    }
  }

  Future<List<RestaurantEntity>> fetchByTag(String tagId) async {
    try {
      final restaurants = await fetchRestaurantsByTag(tagId);
      return restaurants;
    } catch (e) {
      return [];
    }
  }
}
