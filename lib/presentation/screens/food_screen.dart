import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/presentation/providers/products/product_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/widgets/shared/tag_chip.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FoodScreen extends ConsumerWidget {
  final String foodId;
  final productProvider = FutureProvider.autoDispose
      .family<ProductEntity, String>((ref, foodId) async {
    final notifier = ref.read(getProductsProvider.notifier);
    return notifier.fetchById(foodId);
  });
  FoodScreen({super.key, required this.foodId});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productAsync = ref.watch(productProvider(foodId));

    return Scaffold(
      body: productAsync.when(
        data: (product) => CustomScrollView(
          slivers: [
            const CustomSliverAppbar(),
            SliverToBoxAdapter(
              child: Align(
                alignment: Alignment.center,
                child: product.photo != null
                    ? CachedNetworkImage(
                        imageUrl: product.photo!,
                        height: 250,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          height: 250,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(strokeWidth: 2),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/placeholder.png',
                          height: 250,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Image.asset(
                        'assets/placeholder.png',
                        height: 250,
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Wrap(
                      spacing: 10,
                      runSpacing: 10,
                      children: (product.tags ?? [])
                          .map((tag) => TagChip(tagName: tag))
                          .toList(),
                    ),
                    const SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          product.name,
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF277A46),
                          ),
                        ),
                        Text(
                          "\$${product.price.toStringAsFixed(0)}",
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      product.description,
                      style: const TextStyle(fontSize: 16),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      "Ingredients",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF277A46),
                      ),
                    ),
                    (product.ingredients == null ||
                            product.ingredients!.isEmpty)
                        ? const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              "No ingredients available",
                              style: TextStyle(fontSize: 16),
                            ),
                          )
                        : BulletPointList(items: product.ingredients!),
                  ],
                ),
              ),
            ),
          ],
        ),
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, stack) => Center(child: Text('Error: $error')),
      ),
    );
  }
}

class BulletPointList extends StatelessWidget {
  final List<String> items;
  const BulletPointList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                        child:
                            Text(item, style: const TextStyle(fontSize: 16))),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
