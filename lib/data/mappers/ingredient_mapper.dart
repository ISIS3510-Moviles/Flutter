import 'package:campus_bites/data/models/ingredient_backend.dart';
import 'package:campus_bites/domain/entities/ingredient_entity.dart';

class IngredientMapper {
  static IngredientEntity ingredientBackendToEntity(IngredientBackend ingredientBackend) {
    return IngredientEntity(
      id: ingredientBackend.id, 
      name: ingredientBackend.name, 
      description: ingredientBackend.description, 
      image: ingredientBackend.image
    );
  }
}

