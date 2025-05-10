import 'package:campus_bites/data/datasources/dietary_tag_backend_datasource.dart';
import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:campus_bites/domain/repositories/dietary_tag_repository%20copy.dart';


class DietaryTagRepositoryImpl extends DietaryTagRepository {
  final DietaryTagBackendDatasource dietaryTagBackendDatasource;

  DietaryTagRepositoryImpl(this.dietaryTagBackendDatasource);

  @override
  Future<List<DietaryTagEntity>> getDietaryTags() async {
    try {
      return await dietaryTagBackendDatasource.getDietaryTags();
    } catch (e) {
      throw Exception('Error fetching dietary tags: $e');
    }
  }

  @override
  Future<DietaryTagEntity> getDietaryTagById(String id) async {
    try {
      final backendTag = await dietaryTagBackendDatasource.getDietaryTagById(id);
      return backendTag;
    } catch (e) {
      throw Exception('Error fetching dietary tag by ID: $e');
    }
  }
}