import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigationRestaurant extends StatelessWidget {
  final StatefulNavigationShell childView;

  const CustomBottomNavigationRestaurant({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: childView.currentIndex,
      onTap: childView.goBranch,
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Edit',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.table_bar_outlined),
          label: 'Reservations',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Add products',
        ),
      ],
    );
  }
}
