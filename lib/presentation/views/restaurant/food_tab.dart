import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/food_card.dart';

class FoodTab extends StatelessWidget {
  FoodTab({super.key});
  final List<FoodItem> foodItems = [
    FoodItem(
      name: 'Burger',
      imageUrl:
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg',
      price: 10.99,
    ),
    FoodItem(
      name: 'Pizza',
      imageUrl:
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg',
      price: 12.99,
    ),
    FoodItem(
      name: 'Sushi',
      imageUrl:
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg',
      price: 15.99,
    ),
    FoodItem(
      name: 'Pasta',
      imageUrl:
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg',
      price: 9.99,
    ),
    FoodItem(
      name: 'Salad',
      imageUrl:
          'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg',
      price: 8.99,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          FoodSlider(items: foodItems, title: 'Food Menu'),
          const SizedBox(height: 16),
          FoodSlider(items: foodItems, title: 'Popular Items'),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class FoodItem {
  final String name;
  final String imageUrl;
  final double price;

  FoodItem({required this.name, required this.imageUrl, required this.price});
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
            physics: const BouncingScrollPhysics(), // Efecto de desplazamiento iOS/Android
            itemExtent: 180, // Ancho fijo para cada tarjeta
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: SizedBox(
                  width: 180, // Ancho fijo para el FoodCard
                  child: FoodCard(
                    imageUrl: items[index].imageUrl,
                    title: items[index].name,
                    price: '\$${items[index].price.toStringAsFixed(2)}',
                    subtitle: 'Delicious ${items[index].name}',
                    id: index.toString(),
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