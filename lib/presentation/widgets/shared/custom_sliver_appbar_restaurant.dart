import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomSliverAppbarRestaurant extends StatelessWidget {
  const CustomSliverAppbarRestaurant({super.key});

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
        ),
      ),
    );
  }
}