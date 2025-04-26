
import 'package:campus_bites/globals/lru_cache_delete_old_product.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';



final productCacheProvider = Provider<LruCacheDeleteOldProduct>((ref) {
  return LruCacheDeleteOldProduct(capacity: 10, maxTime: 60);
});