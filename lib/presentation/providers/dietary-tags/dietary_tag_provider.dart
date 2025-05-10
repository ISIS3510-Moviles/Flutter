
import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:campus_bites/presentation/providers/dietary-tags/dietary_tag_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDietaryTagsProvider = StateNotifierProvider<DietaryTagNotifier, List<DietaryTagEntity>>((ref) {
  final repository = ref.watch(dietaryTagRepositoryProvider);
  return DietaryTagNotifier(
    fetchDietaryTags: repository.getDietaryTags,
    getDietaryTagById: repository.getDietaryTagById,
  );
});

typedef DietaryTagCallback = Future<List<DietaryTagEntity>> Function();
typedef GetDietaryTagByIdCallback = Future<DietaryTagEntity?> Function(String id);

class DietaryTagNotifier extends StateNotifier<List<DietaryTagEntity>> {
  final DietaryTagCallback fetchDietaryTags;
  final GetDietaryTagByIdCallback getDietaryTagById;

  DietaryTagNotifier({
    required this.fetchDietaryTags,
    required this.getDietaryTagById,
  }) : super([]);


Future<void> fetchDietary() async {
  try {
    final tags = await fetchDietaryTags();
    state = tags;
  } catch (e) {
    print('Error fetching tags: $e');
  }
}
Future<DietaryTagEntity?> fetchById(String id) async {
  try {
    return await getDietaryTagById(id);
  } catch (e) {
    return null;
  }
}
}
