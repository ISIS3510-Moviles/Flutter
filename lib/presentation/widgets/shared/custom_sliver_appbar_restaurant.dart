import 'package:campus_bites/services/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppbarRestaurant extends StatelessWidget {
  const CustomSliverAppbarRestaurant({super.key});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      pinned: true,
      backgroundColor: const Color(0xFFF9A825),
      title: const Text('Restaurant Information'),
      actions: [
        IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () async {
            await AuthService().signOutGoogle();
            context.go('/login');
          },
        ),
      ],
    );
  }
}
