import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/infraestructure/database/isar_instance_provider.dart'; 
import 'package:campus_bites/presentation/providers/restaurants/restaurant_repository_provider.dart';
import 'package:campus_bites/services/restaurant_cache_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRestaurantsProvider = AsyncNotifierProvider<GetRestaurantsNotifier, List<RestaurantEntity>>(GetRestaurantsNotifier.new);

typedef RestaurantCallback = Future<List<RestaurantEntity>> Function(String? nameMatch, List<String>? tagsInclude);
typedef RestaurantByTagCallback = Future<List<RestaurantEntity>> Function(String tagId);

class GetRestaurantsNotifier extends AsyncNotifier<List<RestaurantEntity>> {
  late final RestaurantCacheService _cache;
  late final RestaurantCallback _fetchRestaurants;
  late final RestaurantByTagCallback _fetchRestaurantsByTag;

  @override
  Future<List<RestaurantEntity>> build() async {
    final repository = ref.read(restaurantRepositoryProvider);
    final isar = await ref.watch(isarInstanceProvider.future);
    _cache = RestaurantCacheService(isar);

    _fetchRestaurants = repository.getRestaurants;
    _fetchRestaurantsByTag = repository.getRestaurantsByTag;

    // Inicialmente intenta traer del cache
    final cached = await _cache.getValidCachedRestaurants();
    if (cached.isNotEmpty) {
      return cached;
    }

    final remote = await _fetchRestaurants(null, null);
    await _cache.saveRestaurants(remote);
    return remote;
  }

  Future<void> fetch({String? nameMatch, List<String>? tagsInclude}) async {
    state = const AsyncLoading();
    try {
      final cached = await _cache.getValidCachedRestaurants();
      if (cached.isNotEmpty) {
        state = AsyncData(cached);
        return;
      }

      final remote = await _fetchRestaurants(nameMatch, tagsInclude);
      await _cache.saveRestaurants(remote);
      state = AsyncData(remote);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }


  Future<List<RestaurantEntity>> fetchByTag(String tagId) async {
    try {
      final restaurants = await _fetchRestaurantsByTag(tagId);
      return restaurants;
    } catch (_) {
      return [];
    }
  }
}
