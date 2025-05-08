import 'package:campus_bites/globals/lru_cache_delete_old_restaurant.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final restaurantCacheProvider = Provider<LruCacheDeleteOldRestaurant>((ref) {
  return LruCacheDeleteOldRestaurant(capacity: 10, maxTime: 60);
});