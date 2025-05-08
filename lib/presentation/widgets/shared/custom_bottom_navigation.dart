import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomBottomNavigation extends StatelessWidget {
  final StatefulNavigationShell childView;
  
  const CustomBottomNavigation({
    super.key,
    required this.childView,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      elevation: 0,
      currentIndex: childView.currentIndex,
      onTap: (index) => childView.goBranch(index),
      items: const [
        BottomNavigationBarItem(
          icon: Icon(Icons.home_max_outlined),
          label: 'Home'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.table_bar_outlined),
          label: 'Reservations'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.favorite_outline),
          label: 'Recommendations'
        ),
      ],
    );
  }
}