import 'package:campus_bites/presentation/widgets/shared/responsive_food_list.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';

class SilverListFoodRestaurant extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants;
  final List<Map<String, String>> foods;
  final int currentTabIndex;

  const SilverListFoodRestaurant({
    super.key,
    required this.restaurants,
    required this.foods,
    required this.currentTabIndex,
  });

  @override
  Widget build(BuildContext context) {
    final tabs = [
      _RestaurantTab(restaurants: restaurants),
      _FoodTab(foods: foods),
    ];

    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => tabs[currentTabIndex],
        childCount: 1,
      ),
    );
  }
}

class _RestaurantTab extends StatelessWidget {
  final List<Map<String, dynamic>> restaurants;

  const _RestaurantTab({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestaurantCard(
          title: restaurant['title'] ?? '',
          rating: restaurant['rating'] ?? '0.0',
          distance: restaurant['distance'] ?? '',
          imageUrl: restaurant['imageUrl'] ?? '',
          tags: restaurant['tags'] ?? [],
        );
      },
    );
  }
}

class _FoodTab extends StatelessWidget {
  final List<Map<String, String>> foods;

  const _FoodTab({required this.foods});

  @override
  Widget build(BuildContext context) {
    return ResponsiveFoodList(food: foods);
  }
}