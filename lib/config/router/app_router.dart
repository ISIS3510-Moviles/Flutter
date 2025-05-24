import 'package:campus_bites/presentation/screens/home-screen-restaurant.dart';
import 'package:campus_bites/presentation/screens/login_screen.dart';
import 'package:campus_bites/presentation/screens/profile_screen.dart';
import 'package:campus_bites/presentation/screens/reservation_screen.dart';
import 'package:campus_bites/presentation/screens/reservation_screen_restaurant.dart';
import 'package:campus_bites/presentation/screens/restaurant-info.dart';
import 'package:campus_bites/presentation/screens/screens.dart';
import 'package:campus_bites/presentation/screens/tag_screen.dart';
import 'package:campus_bites/presentation/views/views.dart';
import 'package:campus_bites/services/auth_service.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_bites/presentation/screens/food_screen.dart';
import 'package:flutter/widgets.dart';

final authService = AuthService();
final RouteObserver<ModalRoute<dynamic>> routeObserver = RouteObserver<ModalRoute<dynamic>>();

final appRouter = GoRouter(
  initialLocation: '/login',
  observers: [routeObserver],
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) => LoginScreen(),
    ),

    // Primero las rutas de restaurante
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => HomeScreenRestaurant(childView: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant-panel',
              builder: (_, __) => const RestaurantInfoScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant-panel/reservations',
              builder: (_, __) => const ReservationScreenRestaurant(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant-panel/products',
              builder: (_, __) => const ReservationScreenRestaurant(),
            ),
          ],
        ),
      ],
    ),

    // Luego las rutas de usuarios
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
                  path: 'profile',
                  builder: (context, state) => ProfileScreen(),
                ),
                GoRoute(
                  path: 'restaurant/:restaurantId',
                  builder: (context, state) {
                    final restaurantId = state.pathParameters['restaurantId'];
                    return RestaurantScreen(restaurantId: restaurantId ?? '');
                  },
                ),
                GoRoute(
                  path: 'tags/:tagId',
                  builder: (context, state) {
                    final tagId = state.pathParameters['tagId'];
                    return TagScreen(tagId: tagId ?? "");
                  },
                ),
                GoRoute(
                  path: 'food/:foodId',
                  builder: (context, state) {
                    final foodId = state.pathParameters['foodId'];
                    return FoodScreen(foodId: foodId!);
                  },
                ),
                GoRoute(
                  path: 'notifications',
                  builder: (context, state) => const NotificationsScreen(),
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reservations',
              builder: (context, state) => const ReservationScreen(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/recommendations',
              builder: (context, state) => RecommendationView(),
            ),
          ],
        ),
      ],
    ),
  ],
);