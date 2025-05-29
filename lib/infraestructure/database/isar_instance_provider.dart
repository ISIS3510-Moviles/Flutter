import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart'; 

final isarInstanceProvider = FutureProvider<Isar>((ref) async {
  final dir = await getApplicationDocumentsDirectory();

  final isar = await Isar.open(
    [RestaurantEntitySchema],
    directory: dir.path,
    inspector: true,
  );

  return isar;
});
