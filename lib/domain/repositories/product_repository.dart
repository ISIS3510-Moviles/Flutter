import 'package:campus_bites/domain/entities/product_entity.dart';

abstract class ProductRepository {
  Future<List<ProductEntity>> getProducts();
}
