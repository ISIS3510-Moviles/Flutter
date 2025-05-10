import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';

abstract class DietaryTagRepository {
  Future<List<DietaryTagEntity>> getDietaryTags();
  Future<DietaryTagEntity> getDietaryTagById(String id);
}