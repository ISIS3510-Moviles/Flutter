import 'package:campus_bites/data/datasources/product_backend_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/domain/repositories/product_repository.dart';

class ProductRepositoryImpl extends ProductRepository {
  final ProductBackendDatasource productBackendDatasource;

  ProductRepositoryImpl(this.productBackendDatasource);
  
  @override
  Future<List<ProductEntity>> getProducts() {
    return productBackendDatasource.getProducts();
  }

  @override
  Future<List<ProductEntity>> getProductsByTag(String tagId) {
    return productBackendDatasource.getProductsByTag(tagId);
  }
}
