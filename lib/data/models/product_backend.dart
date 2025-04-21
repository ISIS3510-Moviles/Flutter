class ProductBackend {
  final String id;
  final String name;
  final String description;
  final double rating;
  final double price;
  final bool isAvailable;
  final String? photo;
  final List<String>? tags;

  ProductBackend({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.isAvailable,
    this.photo,
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
