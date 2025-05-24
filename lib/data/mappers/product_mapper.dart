import 'package:campus_bites/data/mappers/ingredient_mapper.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/data/mappers/food_tag_mapper.dart';
import 'package:campus_bites/data/mappers/dietary_tag_mapper.dart';
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
      restaurant: productBackend.restaurant != null
          ? RestaurantMapper.restaurantBackendToEntity(productBackend.restaurant!)
          : null,
      ingredients: productBackend.ingredients != null
          ? productBackend.ingredients!
              .map(IngredientMapper.ingredientBackendToEntity)
              .toList()
          : [],
      foodTags: FoodTagMapper.foodTagBackendToEntity(productBackend.foodTags),
      dietaryTags: DietaryTagMapper.dietaryTagBackendToEntity(productBackend.dietaryTags), 
      tags: productBackend.tags,
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
      restaurant: entity.restaurant != null
          ? RestaurantMapper.restaurantEntityToBackend(entity.restaurant!)
          : null,
    );
  }
}
