import 'package:campus_bites/data/datasources/product_backend_datasource.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar_restaurant.dart';
import 'package:flutter/material.dart';

class TemporalProduct {
  final String photoUrl;
  final String name;
  final String description;
  final double price;
  final List<String> ingredients;
  final List<String> tags;

  TemporalProduct({
    required this.photoUrl,
    required this.name,
    required this.description,
    required this.price,
    required this.ingredients,
    required this.tags,
  });

  @override
  String toString() {
    return '''
TemporalProduct:
  Photo URL: $photoUrl
  Name: $name
  Description: $description
  Price: $price
  Ingredients: $ingredients
  Tags: $tags
''';
  }
}

class AddProductScreen extends StatefulWidget {
  const AddProductScreen({super.key});

  @override
  State<AddProductScreen> createState() => _AddProductScreenState();
}

class _AddProductScreenState extends State<AddProductScreen> {
  final _photoUrlController = TextEditingController();
  final _nameController = TextEditingController();
  final _descriptionController = TextEditingController();
  final _priceController = TextEditingController(text: '0.0');
  final _ingredientController = TextEditingController();
  final _tagController = TextEditingController();

  final List<String> ingredients = [];
  final List<String> tags = [];

  void _createProduct() async {
    final product = TemporalProduct(
      photoUrl: _photoUrlController.text,
      name: _nameController.text,
      description: _descriptionController.text,
      price: double.tryParse(_priceController.text) ?? 0.0,
      ingredients: List.from(ingredients),
      tags: List.from(tags),
    );

    try {
      final productEntity = ProductEntity(
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

      final datasource = ProductBackendDatasource();
      final createdProducts = await datasource.createProduct(productEntity);

      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Product created successfully')),
      );
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Error creating product')),
      );
    }
  }

  Widget _buildLabeledInput(String label, TextEditingController controller,
      {int maxLines = 1, TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label,
              style:
                  const TextStyle(fontWeight: FontWeight.bold, fontSize: 14)),
          const SizedBox(height: 4),
          TextField(
            controller: controller,
            maxLines: maxLines,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              filled: true,
              suffixIcon: IconButton(
                icon: const Icon(Icons.clear),
                onPressed: () => controller.clear(),
              ),
              border: const OutlineInputBorder(),
              hintText: 'Input',
            ),
          ),
          const SizedBox(height: 4),
          Text('The ${label.toLowerCase()}'),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppbarRestaurant(),
          SliverPadding(
            padding: const EdgeInsets.all(16),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  _buildLabeledInput("Product photo", _photoUrlController),
                  _buildLabeledInput("Product name", _nameController),
                  _buildLabeledInput(
                    "Product description",
                    _descriptionController,
                    maxLines: 4,
                  ),
                  _buildLabeledInput(
                    "Product price",
                    _priceController,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.green[700],
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                    onPressed: _createProduct,
                    child: const Text(
                      'Create product',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
