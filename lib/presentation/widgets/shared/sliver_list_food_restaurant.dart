import 'package:campus_bites/domain/entities/entities.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/presentation/widgets/shared/responsive_food_list.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';

class SilverListFoodRestaurant extends StatelessWidget {
  final List<RestaurantEntity> restaurants;
  final List<ProductEntity> foods;
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
  final List<RestaurantEntity> restaurants;

  const _RestaurantTab({required this.restaurants});

  @override
  Widget build(BuildContext context) {
    if (restaurants.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No restaurants found.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return ListView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: restaurants.length,
      itemBuilder: (context, index) {
        final restaurant = restaurants[index];
        return RestaurantCard(
          id: restaurant.id,
          title: restaurant.name,
          rating: restaurant.rating ?? 5.0,
          distance: 200,
          imageUrl: restaurant.profilePhoto ?? '',
          tags: restaurant.tags ?? [],
        );
      },
    );
  }
}

class _FoodTab extends StatelessWidget {
  final List<ProductEntity> foods;

  const _FoodTab({required this.foods});

  @override
  Widget build(BuildContext context) {
    if (foods.isEmpty) {
      return const Center(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Text(
            'No food items found.',
            style: TextStyle(fontSize: 16),
          ),
        ),
      );
    }

    return ResponsiveFoodList(food: foods);
  }
}
