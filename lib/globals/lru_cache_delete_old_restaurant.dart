import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:lru_cache/lru_cache.dart';

class CacheEntry {
  final RestaurantEntity restaurant;
  final DateTime lastAccess;

  CacheEntry(this.restaurant) : lastAccess = DateTime.now();
  CacheEntry.withTimestamp(this.restaurant, this.lastAccess);

  @override
  String toString() {
    return 'CacheEntry(restaurant: $restaurant, lastAccess: $lastAccess)';
  }
}

class LruCacheDeleteOldRestaurant {
  static LruCacheDeleteOldRestaurant? _instance;

  final LruCache<String, CacheEntry> _cache;
  final int maxTime;
  
  LruCacheDeleteOldRestaurant._(this._cache, this.maxTime);

  factory LruCacheDeleteOldRestaurant({required int capacity, required int maxTime}) {
    _instance ??= LruCacheDeleteOldRestaurant._(
        LruCache<String, CacheEntry>(capacity),
        maxTime,
      );
    return _instance!;
  }

  static LruCacheDeleteOldRestaurant get instance {
    if (_instance == null) {
      throw StateError('LruCacheDeleteOldRestaurant has not been initialized. Call the factory constructor first.');
    }
    return _instance!;
  }

  Future<RestaurantEntity?> get(String key) async {
    final entry = await _cache.get(key);
    if (entry == null) return null;

    final now = DateTime.now();
    final difference = now.difference(entry.lastAccess).inMinutes;
    if (difference > maxTime) {
      _cache.remove(key);
      return null;
    }
    return entry.restaurant;
  }

  void put(String key, RestaurantEntity restaurant) {
    _cache.put(key, CacheEntry(restaurant));
  }

  void invalidate(String key) {
    _cache.remove(key);
  }
}