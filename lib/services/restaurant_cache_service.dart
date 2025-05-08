import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:isar/isar.dart';

class RestaurantCacheService {
  final Isar _isar;
  final Duration cacheDuration = const Duration(hours: 1);

  RestaurantCacheService(this._isar);

  Future<List<RestaurantEntity>> getValidCachedRestaurants() async {
    final now = DateTime.now();
    final all = await _isar.restaurantEntitys.where().findAll();
    if (all.isEmpty) return [];

    final firstTimestamp = all.first.cachedAt;
    final isExpired = now.difference(firstTimestamp) > cacheDuration;

    return isExpired ? [] : all;
  }

  Future<void> saveRestaurants(List<RestaurantEntity> restaurants) async {
    final now = DateTime.now();
    final updated = restaurants.map((r) => r..cachedAt = now).toList();

    await _isar.writeTxn(() async {
      await _isar.restaurantEntitys.clear();
      await _isar.restaurantEntitys.putAll(updated);
    });
  }
}