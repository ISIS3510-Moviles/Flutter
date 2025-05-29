import 'package:campus_bites/presentation/providers/restaurants/restaurants_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initialLoadingProvider = Provider<bool>((ref) {
  final restaurantsAsync = ref.watch(getRestaurantsProvider);
  return restaurantsAsync.isLoading;
});
