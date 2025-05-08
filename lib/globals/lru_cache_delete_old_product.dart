import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:lru_cache/lru_cache.dart';

class CacheEntry {
  final ProductEntity product;
  final DateTime lastAccess;

  CacheEntry(this.product) : lastAccess = DateTime.now();
  CacheEntry.withTimestamp(this.product, this.lastAccess);

  @override
  String toString() {
    return 'CacheEntry(product: $product, lastAccess: $lastAccess)';
  }
}

class LruCacheDeleteOldProduct {
  static LruCacheDeleteOldProduct? _instance;

  final LruCache<String, CacheEntry> _cache;
  final int maxTime;


  LruCacheDeleteOldProduct._(this._cache, this.maxTime);

  factory LruCacheDeleteOldProduct({required int capacity, required int maxTime}) {
    _instance ??= LruCacheDeleteOldProduct._(
        LruCache<String, CacheEntry>(capacity),
        maxTime,
      );
    return _instance!;
  }

  Future<ProductEntity?> get(String key) async {
    final entry = await _cache.get(key);
    if (entry == null) return null;

    final now = DateTime.now();
    final difference = now.difference(entry.lastAccess).inMinutes;
    if (difference > maxTime) {
      _cache.remove(key);
      return null;
    }
    return entry.product;
  }

  void put(String key, ProductEntity product) {
    _cache.put(key, CacheEntry(product));
  }
}
