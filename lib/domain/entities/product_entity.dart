import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:isar/isar.dart';
import 'package:campus_bites/data/mappers/dietary_tag_mapper.dart';
import 'package:campus_bites/data/mappers/food_tag_mapper.dart';
import 'package:campus_bites/data/mappers/ingredient_mapper.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/data/models/ingredient_backend.dart';
import 'package:campus_bites/data/models/restaurant_backend.dart';
import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/domain/entities/ingredient_entity.dart';

part 'product_entity.g.dart';

@Collection()
class ProductEntity {
  Id? isarId;

  final String id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final bool isAvailable;
  final String? photo;
  final List<String>? tags;

  @Ignore()
  final List<DietaryTagEntity>? dietaryTags;
  @Ignore()
  final List<FoodTagEntity>? foodTags;
  @Ignore()
  final List<IngredientEntity>? ingredients;
  @Ignore()
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
    this.restaurant,
  });

  factory ProductEntity.fromJson(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id']?.toString() ?? 'Unknown',
      name: json['name']?.toString() ?? 'Unknown',
      description: json['description']?.toString() ?? '',
      rating: (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: (json['price'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['isAvailable'] as bool? ?? true,
      photo: json['photo'] as String?,
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => tag as String)
          .toList(),
      dietaryTags: json['dietaryTags'] != null 
          ? DietaryTagMapper.dietaryTagBackendToEntity(json['dietaryTags'])
          : null,
      foodTags: json['foodTags'] != null 
          ? FoodTagMapper.foodTagBackendToEntity(json['foodTags'])
          : null, 
      ingredients: json['ingredients'] != null
          ? (json['ingredients'] as List<dynamic>?)
              ?.map((ingredientJson) =>
                  IngredientMapper.ingredientBackendToEntity(
                      IngredientBackend.fromJson(ingredientJson)))
              .toList()
          : null,
      restaurant: json['restaurant'] != null 
          ? RestaurantMapper.restaurantBackendToEntity(RestaurantBackend.fromJson(json['restaurant']))
          : null,
    );
  }

Map<String, dynamic> toJson() {
  return {
    'name': name,
    'description': description,
    'price': price,
    'photo': photo,
    'restaurant_id': restaurant?.id ?? '', 
    'rating': rating,
    'ingredientsIds': ingredients?.map((e) => e.id).toList() ?? [],
    'discountsIds': [],
    'commentsIds': [],
    'foodTagIds': foodTags?.map((e) => e.id).toList() ?? [],
    'dietaryTagIds': dietaryTags?.map((e) => e.id).toList() ?? [],
  };
}

  
}