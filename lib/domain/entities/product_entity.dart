import 'package:campus_bites/data/mappers/dietary_tag_mapper.dart';
import 'package:campus_bites/data/mappers/food_tag_mapper.dart';
import 'package:campus_bites/data/mappers/ingredient_mapper.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/data/models/dietary_tag_backend.dart';
import 'package:campus_bites/data/models/food_tag_backend.dart';
import 'package:campus_bites/data/models/ingredient_backend.dart';
import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:campus_bites/domain/entities/entities.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/domain/entities/ingredient_entity.dart';

class ProductEntity {
  final String id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final bool isAvailable;
  final String? photo;
  final List<String>? tags;
  final List<DietaryTagEntity>? dietaryTags;
  final List<FoodTagEntity>? foodTags;
  final List<IngredientEntity>? ingredients;
  final RestaurantEntity? restaurant;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.isAvailable,
    this.photo,
    this.tags,
    this.dietaryTags,
    this.foodTags,
    this.ingredients,
    this.restaurant
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'] as String? ?? '',
      name: json['name'] as String? ?? 'Unknown',
      description: json['description'] as String? ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['isAvailable'] as bool? ?? false,
      photo: json['photo'] as String?,
      restaurant: RestaurantMapper.restaurantBackendToEntity(RestaurantBackend.fromJson(json['restaurant'])), 
      ingredients: json['ingredients'] != null
        ? (json['ingredients'] as List<dynamic>)
            .map((ingredientJson) =>
                IngredientMapper.ingredientBackendToEntity(
                    IngredientBackend.fromJson(ingredientJson)))
            .toList()
        : null,
      foodTags: FoodTagMapper.foodTagBackendToEntity(json['foodTags']), 
      dietaryTags: DietaryTagMapper.dietaryTagBackendToEntity(json['dietaryTags']), 
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => tag as String)
          .toList(),
    );
    
  }
}