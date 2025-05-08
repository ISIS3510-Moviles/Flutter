
import 'package:campus_bites/presentation/providers/users/user_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final loading = ref.watch(getUsersProvider).isEmpty;
  return loading;
});