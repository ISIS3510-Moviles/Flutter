import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/presentation/providers/products/product_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProductsProvider = StateNotifierProvider<ProductNotifier, List<ProductEntity>>((ref) {
  final repository = ref.watch(productRepositoryProvider);
  return ProductNotifier(
    fetchProducts: repository.getProducts,
    fetchProductById: repository.getProductById,
    fetchProductsByTag: repository.getProductsByTag,
  );
});

typedef ProductCallback = Future<List<ProductEntity>> Function();
typedef ProductByTagCallback = Future<List<ProductEntity>> Function(String tagId);
typedef ProductByIdgCallback = Future<ProductEntity> Function(String productId);

class ProductNotifier extends StateNotifier<List<ProductEntity>> {
  final ProductCallback fetchProducts;
  final ProductByTagCallback fetchProductsByTag;
  final ProductByIdgCallback fetchProductById;

  ProductNotifier({
    required this.fetchProducts,
    required this.fetchProductsByTag,
    required this.fetchProductById,
  }) : super([]);

  Future<void> fetch() async {
    try {
      final products = await fetchProducts();
      state = products;
    } catch (e) {
      print('Error fetching all products: $e');
    }
  }

  Future<ProductEntity> fetchById(String productId) async {
    try {
      final product = await fetchProductById(productId);
      return product;
    } catch (e) {
      print('Error fetching single product: $e');
      rethrow;
    }
  }

  Future<List<ProductEntity>> fetchByTag(String tagId) async {
    try {
      final products = await fetchProductsByTag(tagId);
      return products;
    } catch (e) {
      return [];
    }
  }
}
