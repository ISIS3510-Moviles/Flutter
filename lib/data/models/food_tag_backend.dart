class FoodTagBackend {
  final String id;
  final String name;
  final String description;

  const FoodTagBackend({
    required this.id,
    required this.name,
    required this.description,
  });

  factory FoodTagBackend.fromJson(Map<String, dynamic> json) {
    return FoodTagBackend(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
    };
  }
}