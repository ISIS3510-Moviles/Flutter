import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/presentation/providers/products/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsProvider = StateNotifierProvider<ProductNotifier, List<ProductEntity>>((ref) {
  final getProducts = ref.watch(productRepositoryProvider).getProducts;

  return ProductNotifier(fetchProducts: getProducts);
});

typedef ProductCallback = Future<List<ProductEntity>> Function();

class ProductNotifier extends StateNotifier<List<ProductEntity>> {
  ProductCallback fetchProducts;

  ProductNotifier({
    required this.fetchProducts
  }) : super([]);

  Future<void> fetch() async {
    final List<ProductEntity> products = await fetchProducts();
    state = products;
  }
}