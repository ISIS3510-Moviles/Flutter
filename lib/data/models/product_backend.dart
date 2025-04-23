import 'package:campus_bites/data/models/dietary_tag_backend.dart';
import 'package:campus_bites/data/models/food_tag_backend.dart';
import 'package:campus_bites/data/models/ingredient_backend.dart';
import 'package:campus_bites/data/models/restaurant_backend.dart';

class ProductBackend {
  final String id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final bool isAvailable;
  final String? photo;
  final List<String>? tags;
  final RestaurantBackend? restaurant;
  final List<IngredientBackend>? ingredients;
  final List<DietaryTagBackend>? dietaryTags;
  final List<FoodTagBackend>? foodTags;

  ProductBackend({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.isAvailable,
    this.ingredients,
    this.dietaryTags,
    this.foodTags,
    this.photo,
    this.restaurant,
    this.tags,
  });

  factory ProductBackend.fromJson(Map<String, dynamic> json) {
    return ProductBackend(
      id: json['id'] as String? ?? 'Unknown ID',
      name: json['name'] as String? ?? 'Unknown Name',
      description: json['description'] as String? ?? 'No description',
      rating: json['rating'] is double
          ? json['rating'] as double
          : (json['rating'] as num?)?.toDouble() ?? 0.0,
      price: json['price'] is double
          ? json['price'] as double
          : (json['price'] as num?)?.toDouble() ?? 0.0,
      isAvailable: json['isAvailable'] as bool? ?? false,
      photo: json['photo'] as String?,
      tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
      restaurant: json['restaurant'] != null ? RestaurantBackend.fromJson(json['restaurant']) : null,
      foodTags: json['foodTags'] != null
          ? (json['foodTags'] as List)
              .map((tag) => FoodTagBackend.fromJson(tag))
              .toList()
          : [],
      dietaryTags: json['dietaryTags'] != null
          ? (json['dietaryTags'] as List)
              .map((tag) => DietaryTagBackend.fromJson(tag))
              .toList()
          : [],
      ingredients: json['ingredients'] != null
          ? (json['ingredients'] as List)
              .map((ingredient) => IngredientBackend.fromJson(ingredient))
              .toList()
          : [],
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
      'restaurant': restaurant,
    };
  }
}
