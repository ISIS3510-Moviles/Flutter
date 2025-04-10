import 'package:campus_bites/data/models/user_backend.dart';
import 'package:campus_bites/domain/entities/user_entity.dart';

class UserMapper {
  static UserEntity userBackendToEntity(UserBackend backend) {
    return UserEntity(
      id: backend.id,
      name: backend.name,
      phone: backend.phone,
      email: backend.email,
      role: backend.role,
      isPremium: backend.isPremium,
      institution: backend.institution,
      savedProductsIds: backend.savedProductsIds,
    );
  }

  static UserBackend userEntityToBackend(UserEntity entity) {
    return UserBackend(
      id: entity.id,
      name: entity.name,
      phone: entity.phone,
      email: entity.email,
      role: entity.role,
      isPremium: entity.isPremium,
      institution: entity.institution,
      savedProductsIds: entity.savedProductsIds,
    );
  }
}