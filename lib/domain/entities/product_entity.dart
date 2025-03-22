class ProductEntity {
  final String id;
  final String name;
  final String description;
  final int rating;
  final int price;
  final bool isAvailable;
  final List<String>? tags;

  ProductEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.rating,
    required this.price,
    required this.isAvailable,
    this.tags,
  });

  
}
