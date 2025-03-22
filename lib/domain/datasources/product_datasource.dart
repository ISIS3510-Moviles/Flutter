import 'package:campus_bites/domain/entities/product_entity.dart';

abstract class ProductDatasource {
  Future<List<ProductEntity>> getProducts();

  Future<List<ProductEntity>> getProductsByTag(String tag);
}