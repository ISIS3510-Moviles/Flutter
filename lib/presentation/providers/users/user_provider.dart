import 'package:campus_bites/domain/entities/user_entity.dart';
import 'package:campus_bites/presentation/providers/users/user_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getUsersProvider = StateNotifierProvider<UserNotifier, List<UserEntity>>((ref) {
  final repository = ref.watch(userRepositoryProvider);
  return UserNotifier(getUser: repository.getUser);
});

typedef UserIdCallback = Future<UserEntity?> Function(String userId);

class UserNotifier extends StateNotifier<List<UserEntity>> {
  final UserIdCallback getUser;

  UserNotifier({
    required this.getUser,
  }) : super([]);

  Future<UserEntity?> fetchById(String userId) async {
    try {
      final user = await getUser(userId);
      return user;
    } catch (e) {
      print('Error fetching single user: $e');
      rethrow;
    }
  }
}