import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/food_card.dart';

class FoodTab extends StatelessWidget {
  final RestaurantEntity restaurant;

  const FoodTab(this.restaurant, {super.key});

  @override
  Widget build(BuildContext context) {
    if (restaurant.products == null || restaurant.products!.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No food items available.',
            style: TextStyle(fontSize: 16, color: Colors.grey),
          ),
        ),
      );
    }
    final List<FoodItem> foodItems = restaurant.products!
        .map((product) => FoodItem(
              id: product.id,
              name: product.name,
              imageUrl: product.photo ?? 'assets/placeholder.png',
              price: product.price,
            ))
        .toList();

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          FoodSlider(items: foodItems, title: 'Food Menu'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FoodItem {
  final String id;
  final String name;
  final String imageUrl;
  final double price;

  FoodItem({required this.id, required this.name, required this.imageUrl, required this.price});
}

class FoodSlider extends StatelessWidget {
  final String title;
  final List<FoodItem> items;

  const FoodSlider({super.key, required this.title, required this.items});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Text(
            title,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 8),
        SizedBox(
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            physics: const BouncingScrollPhysics(),
            itemExtent: 180,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 180,
                  child: FoodCard(
                    imageUrl: items[index].imageUrl,
                    title: items[index].name,
                    price: items[index].price,
                    id: items[index].id,
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}