import 'package:campus_bites/domain/entities/institution_entity.dart';

class UserBackend {
  final String id;
  final String name;
  final String phone;
  final String email;
  final String role;
  final bool isPremium;
  final String? institutionId;
  final Institution? institution;
  final List<String> savedProductsIds;

  const UserBackend({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    required this.role,
    required this.isPremium,
    this.institution, 
    this.institutionId,
    required this.savedProductsIds,
  });

  factory UserBackend.fromJson(Map<String, dynamic> json) {
    return UserBackend(
      id: json['id'] as String,
      name: json['name'] as String,
      phone: json['phone'] as String,
      email: json['email'] as String,
      role: json['role'] as String,
      isPremium: json['isPremium'] as bool,
      institution: json['institution'] != null
          ? Institution.fromJson(json['institution'] as Map<String, dynamic>)
          : null,
      savedProductsIds: (json['savedProductsIds'] as List<dynamic>? ?? [])
          .map((e) => e as String)
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'phone': phone,
      'email': email,
      'role': role,
      'isPremium': isPremium,
      'institution': institution?.toJson(),
      'savedProductsIds': savedProductsIds,
    };
  }
}