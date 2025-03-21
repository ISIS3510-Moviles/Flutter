import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppbar extends StatelessWidget {
  const CustomSliverAppbar({super.key});

  @override
  Widget build(BuildContext context) {

    return SliverAppBar(
      floating: true,
      flexibleSpace: FlexibleSpaceBar(
        title: _CustomAppbar(),
      ),
      backgroundColor: Color(0xFFF9A825),
    );
  }
}

class _CustomAppbar extends StatelessWidget {
  const _CustomAppbar();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SizedBox(
        width: double.infinity,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () => context.go('/notifications'),
              icon: const Icon(Icons.notifications_active_outlined),
            ),
            IconButton(
              onPressed:  () => context.go('/profile'),
              icon: const Icon(Icons.account_circle_outlined),
            ),
          ],
        ),
      ),
    );
  }
}