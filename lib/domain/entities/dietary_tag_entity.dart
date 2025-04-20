class DietaryTagEntity {
  final String id;
  final String name;
  final String description;
  final String? icon;

  const DietaryTagEntity({
    required this.id,
    required this.name,
    required this.description, 
    this.icon
  });
}