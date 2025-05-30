import 'package:campus_bites/config/constants/environment.dart';
import 'package:campus_bites/data/mappers/product_mapper.dart';
import 'package:campus_bites/data/models/product_backend.dart';
import 'package:campus_bites/domain/datasources/product_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/globals/GlobalRestaurant.dart';
import 'package:dio/dio.dart';

class ProductBackendDatasource extends ProductDatasource {
  final dio = Dio(BaseOptions(baseUrl: Environment.backendApi));

  List<ProductEntity> _jsonToProducts(List<dynamic> json) {
    return json
        .map((e) =>
            ProductMapper.productBackendToEntity(ProductBackend.fromJson(e)))
        .toList();
  }

  ProductEntity _jsonToProduct(Map<String, dynamic> json) {
    return ProductEntity(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: (json['price'] as num).toDouble(),
      photo: json['photo'],
      rating: (json['rating'] as num).toDouble(),
      isAvailable: true,
      ingredients: [],
      foodTags: [],
      dietaryTags: [],
    );
  }

  @override
  Future<List<ProductEntity>> getProducts() async {
    final response = await dio.get('/product');
    return _jsonToProducts(response.data);
  }

  @override
  Future<List<ProductEntity>> getProductsByTag(String tagId) async {
    final response = await dio.get('/product/by-food-tag/$tagId');
    final data = response.data;
    final products = _jsonToProducts(data['products'] as List<dynamic>);
    return products;
  }

  Future<List<ProductEntity>> createProduct(ProductEntity product) async {
    try {
      final payload = {
        'name': product.name,
        'description': product.description,
        'price': product.price,
        'photo': product.photo,
        'restaurant_id': product.restaurant?.id ??
            GlobalRestaurant().currentRestaurant?.id ??
            '',
        'rating': product.rating,
        'ingredientsIds': product.ingredients?.map((e) => e.id).toList() ?? [],
        'discountsIds': [],
        'commentsIds': [],
        'foodTagIds': product.foodTags?.map((e) => e.id).toList() ?? [],
        'dietaryTagIds': product.dietaryTags?.map((e) => e.id).toList() ?? [],
      };

      print('📦 Payload enviado al backend:');
      payload.forEach((key, value) {
        print(' - $key: $value');
      });

      final response = await dio.post('/product/', data: payload);

      print('✅ Producto creado con éxito. Respuesta: ${response.data}');

      final data = response.data;
      return [_jsonToProduct(data)];
    } catch (e, stacktrace) {
      print('❌ Error creando producto: $e');

      if (e is DioException) {
        print('📥 DioException response: ${e.response?.data}');
        print('📋 Status code: ${e.response?.statusCode}');
        print('📋 Headers: ${e.response?.headers}');
      }

      print('🧵 Stacktrace:\n$stacktrace');
      throw Exception('Error creating product: $e');
    }
  }

  @override
  Future<ProductEntity> getProductById(String productId) async {
    try {
      final response = await dio.get('/product/full/$productId');
      final data = response.data;

      final productBackend = ProductBackend.fromJson(data);
      final product = ProductMapper.productBackendToEntity(productBackend);

      return product;
    } catch (e) {
      print('Error fetching product by id: $e');
      throw Exception('Error fetching product by id: $e');
    }
  }
}
