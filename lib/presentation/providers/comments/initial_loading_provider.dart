
import 'package:campus_bites/presentation/providers/comments/comment_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final loading = ref.watch(getCommentsProvider).isEmpty;
  return loading;
});