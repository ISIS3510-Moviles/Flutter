import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/presentation/providers/food-tags/food_tag_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFoodTagsProvider = StateNotifierProvider<FoodTagNotifier, List<FoodTagEntity>>((ref) {
  final repository = ref.watch(foodTagRepositoryProvider);
  return FoodTagNotifier(
    fetchFoodTags: repository.getFoodTags,
    getFoodTagById: repository.getFoodTagById,
  );
});

typedef FoodTagCallback = Future<List<FoodTagEntity>> Function();
typedef GetFoodTagByIdCallback = Future<FoodTagEntity?> Function(String id);

class FoodTagNotifier extends StateNotifier<List<FoodTagEntity>> {
  final FoodTagCallback fetchFoodTags;
  final GetFoodTagByIdCallback getFoodTagById;

  FoodTagNotifier({
    required this.fetchFoodTags,
    required this.getFoodTagById,
  }) : super([]);


Future<void> fetchFood() async {
  try {
    final tags = await fetchFoodTags();
    state = tags;
  } catch (e) {
    print('Error fetching tags: $e');
  }
}
Future<FoodTagEntity?> fetchById(String id) async {
  try {
    return await getFoodTagById(id);
  } catch (e) {
    return null;
  }
}
}
