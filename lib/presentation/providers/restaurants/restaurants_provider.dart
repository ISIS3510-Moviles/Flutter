import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/infraestructure/database/isar_instance_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurant_repository_provider.dart';
import 'package:campus_bites/services/restaurant_cache_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRestaurantsProvider =
    AsyncNotifierProvider<GetRestaurantsNotifier, List<RestaurantEntity>>(
        GetRestaurantsNotifier.new);

typedef RestaurantCallback = Future<List<RestaurantEntity>> Function(
    String? nameMatch, List<String>? tagsInclude);
typedef RestaurantByTagCallback = Future<List<RestaurantEntity>> Function(
    String tagId);

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
    print("Fetching restaurants with nameMatch: $nameMatch and tagsInclude: $tagsInclude");
    try {
      final cached = await _cache.getValidCachedRestaurants();
      List<RestaurantEntity> filterRestaurants(
          List<RestaurantEntity> restaurants) {
        return restaurants.where((restaurant) {
          final nameMatches = nameMatch == null ||
              restaurant.name.toLowerCase().contains(nameMatch.toLowerCase());
          final tagsMatch = tagsInclude == null ||
              (restaurant.tags ?? []).any((tag) => tagsInclude.contains(tag));
          return nameMatches && tagsMatch;
        }).toList();
      }

      try {
        final remote = await _fetchRestaurants(nameMatch, tagsInclude);
        await _cache.saveRestaurants(remote);
        state = AsyncData(remote);
      } catch (remoteError, stRemote) {
        final filtered = filterRestaurants(cached);
        if (filtered.isNotEmpty) {
          state = AsyncData(filtered);
        } else {
          state = AsyncError(remoteError, stRemote);
        }
      }
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<List<RestaurantEntity>> fetchByTag(String tagId) async {
    try {
      final cached = await _cache.getValidCachedRestaurants();  
      final filtered = cached.where((restaurant) => (restaurant.foodTagsIds ?? []).contains(tagId)).toList();
      if (filtered.isNotEmpty) {
        return filtered;
      }
      final remote = await _fetchRestaurantsByTag(tagId);
      await _cache.saveRestaurants(remote);
      return remote;
    } catch (_) {
      return [];
    }
  }
}
