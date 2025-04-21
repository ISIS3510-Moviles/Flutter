class ProductEntity {
  final String id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final bool isAvailable;
  final String? photo;
  final List<String>? tags;
  final List<String>? dietaryTags;
  final List<String>? foodTags;
  final List<String>? ingredients;

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
    this.ingredients
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
      tags: (json['tags'] as List<dynamic>?)
          ?.map((tag) => tag as String)
          .toList(),
    );
  }
}