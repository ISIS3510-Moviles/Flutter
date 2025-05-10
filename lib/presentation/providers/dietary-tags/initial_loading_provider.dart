import 'package:campus_bites/presentation/providers/dietary-tags/dietary_tag_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final loading = ref.watch(getDietaryTagsProvider).isEmpty;
  return loading;
});