import 'package:campus_bites/data/mappers/dietary_tag_mapper.dart';
import 'package:campus_bites/data/mappers/food_tag_mapper.dart';
import 'package:campus_bites/data/mappers/ingredient_mapper.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
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
      id: json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? 'Unknown',
      description: json['description']?.toString() ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      photo: json['photo'] as String?,
      restaurant: json['restaurant'] != null 
        ? RestaurantMapper.restaurantBackendToEntity(RestaurantBackend.fromJson(json['restaurant']))
        : null, 
      ingredients: json['ingredients'] != null
        ? (json['ingredients'] as List<dynamic>?)
            ?.map((ingredientJson) =>
                IngredientMapper.ingredientBackendToEntity(
                    IngredientBackend.fromJson(ingredientJson)))
            .toList()
        : null,
      foodTags: json['foodTags'] != null 
        ? FoodTagMapper.foodTagBackendToEntity(json['foodTags'])
        : null, 
      dietaryTags: json['dietaryTags'] != null
        ? DietaryTagMapper.dietaryTagBackendToEntity(json['dietaryTags'])
        : null, 
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => tag as String)
          .toList(),
    );
  }

    Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'rating': rating,
      'price': price,
      'isAvailable': isAvailable,
      'photo': photo,
      'tags': tags,
    };
  }
}