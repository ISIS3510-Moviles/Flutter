import 'package:campus_bites/presentation/widgets/shared/custom_bottom_navigation-restaurant.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreenRestaurant extends StatelessWidget {
  static const name = 'home-screen-restaurant';
  final StatefulNavigationShell childView;

  const HomeScreenRestaurant({
    super.key,
    required this.childView}
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: childView,
      ),
      bottomNavigationBar: CustomBottomNavigationRestaurant(childView: childView),
    );
  }
}