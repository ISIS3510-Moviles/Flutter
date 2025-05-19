import 'package:campus_bites/data/datasources/product_backend_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductBackendDatasource productBackendDatasource;

  ProductRepositoryImpl(this.productBackendDatasource);
  
  @override
  Future<List<ProductEntity>> getProducts() async {
    try {
      return await productBackendDatasource.getProducts();
    } catch (e) {
      throw Exception('Error fetching products: $e');
    }
  }

  @override
  Future<List<ProductEntity>> getProductsByTag(String tagId) async {
    try {
      return await productBackendDatasource.getProductsByTag(tagId);
    } catch (e) {
      throw Exception('Error fetching products by tag: $e');
    }
  }

  @override
  Future<ProductEntity> getProductById(String productId) async {
    try {
      return await productBackendDatasource.getProductById(productId);
    } catch (e) {
      throw Exception('Error fetching product by ID: $e');
    }
  }
}
