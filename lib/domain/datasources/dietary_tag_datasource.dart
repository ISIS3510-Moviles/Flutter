import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';

abstract class DietaryTagDatasource {
  Future<List<DietaryTagEntity>> getDietaryTags();
  Future<DietaryTagEntity> getDietaryTagById(String id);
}