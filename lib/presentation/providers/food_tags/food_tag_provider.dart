import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/presentation/providers/food_tags/food_tag_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getFoodTagsProvider = StateNotifierProvider<FoodTagNotifier, List<FoodTagEntity>>((ref) {
  final getFoodTags = ref.watch(foodTagRepositoryProvider).getFoodTags;
  return FoodTagNotifier(fetchFoodTags: getFoodTags);
});

typedef FoodTagCallback = Future<List<FoodTagEntity>> Function();

class FoodTagNotifier extends StateNotifier<List<FoodTagEntity>> {
  final Future<List<FoodTagEntity>> Function() fetchFoodTags;

  FoodTagNotifier({required this.fetchFoodTags}) : super([]);

  Future<void> fetch() async {
    try {
      final tags = await fetchFoodTags();
      state = tags;
    } catch (e) {
      print('Error in FoodTagNotifier fetch: $e');
    }
  }
}