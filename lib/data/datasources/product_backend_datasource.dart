import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/product_mapper.dart';
import 'package:campus_bites/data/models/product_backend.dart';
import 'package:campus_bites/domain/datasources/product_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:dio/dio.dart';

class ProductBackendDatasource extends ProductDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<ProductEntity> _jsonToProducts(List<dynamic> json) {
    return json
        .map((e) =>
            ProductMapper.productBackendToEntity(ProductBackend.fromJson(e)))
        .toList();
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await dio.get('/product');
    return _jsonToProducts(response.data);
  }

  @override
  Future<List<ProductEntity>> getProductsByTag(String tag) async {
    var response = await getProducts();
    response = response
        .where((product) => product.tags?.contains(tag) ?? false)
        .toList();
    return response;
  }
}
