import 'package:campus_bites/domain/entities/restaurant_entity.dart'; 
import 'package:campus_bites/presentation/providers/restaurants/restaurant_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRestaurantsProvider = StateNotifierProvider<RestaurantNotifier, List<RestaurantEntity>>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);

  return RestaurantNotifier(
    fetchRestaurants: repository.getRestaurants,
    fetchRestaurantById: repository.getRestaurantById,
    fetchRestaurantsByTag: repository.getRestaurantsByTag,
  );
});

typedef RestaurantCallback = Future<List<RestaurantEntity>> Function(String? nameMatch, List<String>? tagsInclude);
typedef RestaurantByIdCallback = Future<RestaurantEntity> Function(String id);
typedef RestaurantByTagCallback = Future<List<RestaurantEntity>> Function(String tagId);

class RestaurantNotifier extends StateNotifier<List<RestaurantEntity>> {
  final RestaurantCallback fetchRestaurants;
  final RestaurantByIdCallback fetchRestaurantById;
  final RestaurantByTagCallback fetchRestaurantsByTag;

  RestaurantNotifier({
    required this.fetchRestaurants,
    required this.fetchRestaurantById,
    required this.fetchRestaurantsByTag,
  }) : super([]);

  Future<void> fetch({String? nameMatch, List<String>? tagsInclude}) async {
    try {
      final restaurants = await fetchRestaurants(nameMatch, tagsInclude);
      state = restaurants;
    } catch (e) {
      print('Error fetching restaurants: $e');
    }
  }

  Future<void> fetchOne(String id) async {
    try {
      final prevState = [...state];
      state = [];
      final restaurant = await fetchRestaurantById(id);
      final updated = [
        restaurant,
        ...prevState.where((r) => r.id != restaurant.id),
      ];
      state = updated;
    } catch (e) {
      print('Error fetching restaurant by id: $e');
    }
  }

  Future<List<RestaurantEntity>> fetchByTag(String tagId) async {
    try {
      final restaurants = await fetchRestaurantsByTag(tagId);
      return restaurants;
    } catch (e) {
      print('Error fetching restaurants by tag: $e');
      return [];
    }
  }
}
