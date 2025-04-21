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

  static ProductBackend productEntityToBackend(ProductEntity entity) {
    return ProductBackend(
      id: entity.id,
      name: entity.name,
      description: entity.description,
      rating: entity.rating,
      price: entity.price,
      photo: entity.photo,
      isAvailable: entity.isAvailable,
    );
  }
}
