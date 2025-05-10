class DietaryTagBackend {
  final String id;
  final String name;
  final String description;

  const DietaryTagBackend({
    required this.id,
    required this.name,
    required this.description,
  });

  factory DietaryTagBackend.fromJson(Map<String, dynamic> json) {
    return DietaryTagBackend(
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