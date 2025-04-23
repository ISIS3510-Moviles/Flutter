class IngredientBackend {
  String id;
  String name;
  String description;
  String image;

  IngredientBackend({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
  });

  factory IngredientBackend.fromJson(Map<String, dynamic> json) {
    return IngredientBackend(
      id: json['id'] as String? ?? 'Unknown ID',
      name: json['name'] as String? ?? 'Unknown Name',
      description: json['description'] as String? ?? 'No description',
      image: json['image'] as String,
    );
  }

}