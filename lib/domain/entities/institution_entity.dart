class Institution {
  final String id;
  final List<String> buildingsIds;
  final List<String> membersIds;
  final String name;
  final String description;

  const Institution({
    required this.id,
    required this.buildingsIds,
    required this.membersIds,
    required this.name,
    required this.description,
  });

  factory Institution.fromJson(Map<String, dynamic> json) {
    return Institution(
      id: json['id'] as String,
      buildingsIds: (json['buildingsIds'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      membersIds: (json['membersIds'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
      name: json['name'] as String,
      description: json['description'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'buildingsIds': buildingsIds,
      'membersIds': membersIds,
      'name': name,
      'description': description,
    };
  }
}