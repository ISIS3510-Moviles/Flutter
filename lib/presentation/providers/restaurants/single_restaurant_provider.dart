import 'package:campus_bites/domain/entities/restaurant_entity.dart'; 
import 'package:campus_bites/presentation/providers/restaurants/restaurant_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getSingleRestaurantProvider = StateNotifierProvider<SingleRestaurantNotifier, List<RestaurantEntity>>((ref) {
  final repository = ref.watch(restaurantRepositoryProvider);

  return SingleRestaurantNotifier(
    fetchRestaurantById: repository.getRestaurantById,
  );
});

typedef RestaurantByIdCallback = Future<RestaurantEntity> Function(String id);


class SingleRestaurantNotifier extends StateNotifier<List<RestaurantEntity>> {
  final RestaurantByIdCallback fetchRestaurantById;

  SingleRestaurantNotifier({
    required this.fetchRestaurantById,
  }) : super([]);


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

  void setOne(RestaurantEntity restaurant) {
    state = [restaurant];
  }
}
