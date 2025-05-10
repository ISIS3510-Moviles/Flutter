class IngredientEntity {
  String id;
  String name;
  String description;
  String image;

  IngredientEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory IngredientEntity.fromJson(Map<String, dynamic> json) {
    return IngredientEntity(
      id: json['id'] as String? ?? 'Unknown ID',
      name: json['name'] as String? ?? 'Unknown Name',
      description: json['description'] as String? ?? 'No description',
      image: json['image'] as String,
    );
  }
}