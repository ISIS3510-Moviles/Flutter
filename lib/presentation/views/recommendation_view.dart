import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';
import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class RecommendationView extends ConsumerStatefulWidget {
  const RecommendationView({super.key});

  @override
  RecommendationViewState createState() => RecommendationViewState();
}

class RecommendationViewState extends ConsumerState<RecommendationView>
    with WidgetsBindingObserver, RouteAware {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List<dynamic> restaurants = [];

  @override
  void initState() {
    super.initState();
    _fetchRestaurants();
  }

  Future<void> _fetchRestaurants() async {
    try {
      Dio dio = Dio();
      final response = await dio.post(
        'http://35.208.18.145:8000/recommend',
        data: {'user_id': 'mhb5GrYjKYb52x7Cub5yT7LlPIo1'},
      );
      if (response.statusCode == 200) {
        setState(() {
          restaurants = response.data;
        });
      } else {
      }
    } catch (e) {
    }
  }
  @override
  Widget build(BuildContext context) {
    if (restaurants.isEmpty) return const FullScreenLoader();

    return Scaffold(
      appBar: null,
      key: _scaffoldKey,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),      
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 314,
                        child: Column(
                          children: [
                            _Title(
                                title: 'Restaurants', subTitle: 'For you'),
                            ...restaurants.map((restaurant) {
                              return RestaurantCard(
                                id: restaurant.id,
                                title: restaurant['name'],
                                rating: restaurant['rating'],
                                distance: 200,
                                imageUrl: restaurant['profilePhoto'] ?? '',
                                tags: List<String>.from(restaurant['tags'] ?? []),
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              }, childCount: 1),
            )
          ],
        ),
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (title != null) Text(title!, style: titleStyle),
            const Spacer(),
            if (subTitle != null)
              FilledButton.tonal(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFF46417)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  subTitle!,
                  style: TextStyle(color: Colors.white),
                ),
              )
          ],
        ));
  }
}
