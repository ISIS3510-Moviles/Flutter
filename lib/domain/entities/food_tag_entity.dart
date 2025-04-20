class FoodTagEntity {
  final String id;
  final String name;
  final String description;
  final String? icon;

  const FoodTagEntity({
    required this.id,
    required this.name,
    required this.description, 
    this.icon
  });
}