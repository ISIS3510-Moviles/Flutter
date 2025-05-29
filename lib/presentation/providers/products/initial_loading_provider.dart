import 'package:campus_bites/presentation/providers/products/product_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final loading = ref.watch(getProductsProvider).isEmpty;
  return loading;
});