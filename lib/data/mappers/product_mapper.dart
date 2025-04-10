import 'package:campus_bites/data/models/product_backend.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';

class ProductMapper {
  static ProductEntity productBackendToEntity(ProductBackend productBackend) {
    return ProductEntity(
      id: productBackend.id,
      name: productBackend.name,
      description: productBackend.description,
      rating: productBackend.rating,
      price: productBackend.price,
      photo: productBackend.photo,
      isAvailable: productBackend.isAvailable,
    );
  }
  static List<Map<String, String>> mapEntitiesToProductCard(
      List<ProductEntity> products) {
    return products.map((product) {
      return {
        'id': product.id ?? '',
        'title': product.name ?? 'Unknown Product',
        'price': product.price.toString(),
        'subtitle': product.description ?? '',
        'imageUrl': product.photo ?? 'http://assets/placeholder.png',
      };
    }).toList();
  }
}
