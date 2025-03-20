import 'package:campus_bites/presentation/widgets/shared/food_card.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';
import 'package:responsive_builder/responsive_builder.dart';

class SilverListFoodRestaurant extends StatelessWidget {
  final tabs = [
    _RestaurantTab(),
    _FoodTab(),
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

class _FoodTab extends StatelessWidget {
  const _FoodTab();

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> food = [
      {
        'id': '1',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '2',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '3',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '4',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '5',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '6',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '7',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '8',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '9',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '10',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '11',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '12',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '13',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '14',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '15',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '16',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '17',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '18',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
      {
        'id': '19',
        'title': 'SeneTamale',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg'
      },
      {
        'id': '20',
        'title': 'Seneca Burguer',
        'price': '\$40.000',
        'subtitle': 'Seneca Food',
        'imageUrl':
            'https://as1.ftcdn.net/v2/jpg/02/17/34/30/1000_F_217343007_9Gpk6FQLW4VKtQ971OwAeMxds6v7lTZk.jpg'
      },
    ];

    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 260,
              crossAxisCount:
                  (sizingInformation.localWidgetSize.width / 250).round(),
            ),
            itemCount: food.length,
            itemBuilder: (context, index) {
              final item = food[index];
              return FoodCard(
                id: item['id'] ?? '0',
                imageUrl: item['imageUrl']!,
                title: item['title']!,
                price: item['price']!,
                subtitle: item['subtitle']!,
              );
            },
          ),
        );
      },
    );
  }
}
