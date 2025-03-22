class ProductBackend {
  final String id;
  final String name;
  final String description;
  final int rating;
  final int price;
  final bool isAvailable;

  ProductBackend({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.isAvailable,
  });

  factory ProductBackend.fromJson(Map<String, dynamic> json) {
    return ProductBackend(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      rating: json['rating'],
      price: json['price'],
      isAvailable: json['isAvailable'],
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
    };
  }
}
