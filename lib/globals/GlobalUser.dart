import 'package:campus_bites/domain/entities/user_entity.dart';

class GlobalUser {
  static final GlobalUser _instance = GlobalUser._internal();

  UserEntity? currentUser;

  GlobalUser._internal();

  factory GlobalUser() {
    return _instance;
  }
}