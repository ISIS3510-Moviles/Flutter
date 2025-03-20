import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';



class SilverListFoodRestaurant extends StatelessWidget {
  final tabs = [
    _RestaurantTab(),
    Text('Food results'),
  ];
  final int currentTabIndex;
  SilverListFoodRestaurant({super.key, required this.currentTabIndex});

  @override
  Widget build(BuildContext context) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        (context, index) => tabs[currentTabIndex],
        childCount: 1,
      ),
    );
  }
}

class _RestaurantTab extends StatelessWidget {
  const _RestaurantTab();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> restaurants = [
      {
        'title': 'Starbucks (Andes)',
        'rating': '4.5',
        'distance': '300 meters',
        'imageUrl': 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png'
      },
      {
        'title': 'Tostao (Andes)',
        'rating': '4.5',
        'distance': '300 meters',
        'imageUrl':
            'https://mir-s3-cdn-cf.behance.net/projects/404/f7aa47209881437.Y3JvcCw4MDgsNjMyLDAsMA.png'
      },
      {
        'title': 'Juan Valdez (Andes)',
        'rating': '4.5',
        'distance': '300 meters',
        'imageUrl':
            'https://mir-s3-cdn-cf.behance.net/projects/404/5a9d41129272323.Y3JvcCwxMDE4LDc5NywyLDA.png'
      }
    ];

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
        );
      },
    );
  }
}