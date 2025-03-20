import 'package:flutter/material.dart';

class SilverTabFoodRestaurant extends StatelessWidget {
  final TabController tabController;
  const SilverTabFoodRestaurant({super.key, required this.tabController});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      automaticallyImplyLeading: false,
      pinned: true,
      flexibleSpace: Container(
        color: const Color(0xFFF5F5F5),
        child: Column(
          children: [
            SizedBox(
              height: 50,
              child: TabBar(
                controller: tabController,
                tabs: const [
                  Tab(icon: Icon(Icons.storefront_sharp)),
                  Tab(icon: Icon(Icons.menu_book)),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

