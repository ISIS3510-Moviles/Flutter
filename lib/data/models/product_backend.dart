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
  final List<dynamic>? dietaryTags;
  final List<dynamic>? foodTags;

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
    try {
      return ProductBackend(
        id: json['id']?.toString() ?? 'Unknown ID',
        name: json['name']?.toString() ?? 'Unknown Name',
        description: json['description']?.toString() ?? 'No description',
        rating: json['rating'] is double
            ? json['rating'] as double
            : (json['rating'] as num?)?.toDouble() ?? 0.0,
        price: json['price'] is double
            ? json['price'] as double
            : (json['price'] as num?)?.toDouble() ?? 0.0,
        isAvailable: json['isAvailable'] as bool? ?? true,
        photo: json['photo'] as String?,
        tags: json['tags'] != null ? List<String>.from(json['tags']) : null,
        restaurant: json['restaurant'] != null 
            ? RestaurantBackend.fromJson(json['restaurant'] as Map<String, dynamic>) 
            : null,
        foodTags: json['foodTags'], // Store as List<dynamic>
        dietaryTags: json['dietaryTags'], // Store as List<dynamic>
        ingredients: json['ingredients'] != null
            ? (json['ingredients'] as List)
                .map((ingredient) => IngredientBackend.fromJson(ingredient as Map<String, dynamic>))
                .toList()
            : [],
      );
    } catch (e) {
      rethrow;
    }
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
