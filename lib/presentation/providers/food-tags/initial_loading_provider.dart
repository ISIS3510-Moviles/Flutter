import 'package:campus_bites/presentation/providers/food-tags/food_tag_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final loading = ref.watch(getFoodTagsProvider).isEmpty;
  return loading;
});