import 'package:campus_bites/presentation/screens/screens.dart';
import 'package:campus_bites/presentation/screens/tag_screen.dart';
import 'package:campus_bites/presentation/views/views.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => HomeScreen(childView: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const HomeView(),
              routes: [
                GoRoute(
                  path: '/restaurant',
                  builder: (context, state) => const RestaurantScreen()
                ),

                GoRoute(
                  path: 'tags/:tagName',
                  builder: (context, state) {
                    final tagName = state.pathParameters['tagName'];
                    return TagScreen(tagName: tagName!);
                  },
                ),

                GoRoute(
                  path: 'food/:foodId',
                  builder: (context, state) {
                    final foodId = state.pathParameters['foodId'];
                    return Text('Food ID: $foodId');
                  },
                ),

                GoRoute(
                  path: '/notifications',
                  builder: (context, state) => const NotificationsScreen()
                )
              ]
            ),
          ]
        ),
      ]
    ),
  ]
);
