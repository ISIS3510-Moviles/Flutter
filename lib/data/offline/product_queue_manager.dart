import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:campus_bites/data/datasources/product_backend_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/data/offline/queued_product.dart';

class ProductQueueManager {
  final _box = Hive.box<QueuedProduct>('queued_products');
  final _connectivity = Connectivity();

  Future<void> addToQueue(QueuedProduct product) async {
    await _box.add(product);
  }

  Future<void> tryToSendQueuedProducts({
    void Function(String)? onProductSent,
  }) async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return;

    final products = _box.values.toList();

    for (final product in products) {
      try {
        final entity = ProductEntity(
          id: '',
          name: product.name,
          description: product.description,
          price: product.price,
          photo: product.photoUrl,
          rating: 0.0,
          isAvailable: true,
          ingredients: [],
          foodTags: [],
          dietaryTags: [],
        );

        await ProductBackendDatasource().createProduct(entity);
        await product.delete();
        onProductSent?.call('Product created successfully.');
      } catch (e) {
        await product.delete();
        onProductSent?.call('Error creating product: ${e.toString()}');
      }
    }
  }

  void startListener({void Function(String)? onProductSent}) {
    tryToSendQueuedProducts(onProductSent: onProductSent);
    _connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        tryToSendQueuedProducts(onProductSent: onProductSent);
      }
    });
  }
}
