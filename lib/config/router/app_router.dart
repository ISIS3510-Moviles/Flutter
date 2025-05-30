import 'package:campus_bites/presentation/screens/add-product-screen.dart';
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
import 'package:firebase_analytics/firebase_analytics.dart';

final authService = AuthService();
final RouteObserver<ModalRoute<dynamic>> routeObserver = RouteObserver<ModalRoute<dynamic>>();
final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

void _logScreenView(String screenName, {Map<String, dynamic>? parameters}) {
  _analytics.logEvent(
    name: 'used_functionality',
    parameters: {
      'functionality': screenName,
      'timestamp': DateTime.now().toIso8601String(),
      ...?parameters,
    },
  );
}

final appRouter = GoRouter(
  initialLocation: '/login',
  observers: [routeObserver],
  routes: [
    GoRoute(
      path: '/login',
      builder: (context, state) {
        _logScreenView('Login Screen');
        return LoginScreen();
      },
    ),

    // Primero las rutas de restaurante
    StatefulShellRoute.indexedStack(
      builder: (context, state, child) => HomeScreenRestaurant(childView: child),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant-panel',
              builder: (context, state) {
                _logScreenView('Restaurant Panel - Info', parameters: {
                  'user_type': 'restaurant',
                  'panel_section': 'info',
                });
                return const RestaurantInfoScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant-panel/reservations',
              builder: (context, state) {
                _logScreenView('Restaurant Panel - Reservations', parameters: {
                  'user_type': 'restaurant',
                  'panel_section': 'reservations',
                });
                return const ReservationScreenRestaurant();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/restaurant-panel/products',
              builder: (context, state) {
                _logScreenView('Restaurant Panel - Add Products', parameters: {
                  'user_type': 'restaurant',
                  'panel_section': 'products',
                });
                return AddProductScreen();
              },
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
              builder: (context, state) {
                _logScreenView('Home Screen', parameters: {
                  'user_type': 'customer',
                });
                return const HomeView();
              },
              routes: [
                GoRoute(
                  path: 'profile',
                  builder: (context, state) {
                    _logScreenView('View user profile', parameters: {
                      'user_type': 'customer',
                      'screen_type': 'profile',
                    });
                    return ProfileScreen();
                  },
                ),
                GoRoute(
                  path: 'restaurant/:restaurantId',
                  builder: (context, state) {
                    final restaurantId = state.pathParameters['restaurantId'];
                    _logScreenView('View restaurant details', parameters: {
                      'user_type': 'customer',
                      'screen_type': 'restaurant_detail',
                    });
                    return RestaurantScreen(restaurantId: restaurantId ?? '');
                  },
                ),
                GoRoute(
                  path: 'tags/:tagId',
                  builder: (context, state) {
                    final tagId = state.pathParameters['tagId'];
                    _logScreenView('View tag screen', parameters: {
                      'user_type': 'customer',
                      'screen_type': 'tag_filter',
                    });
                    return TagScreen(tagId: tagId ?? "");
                  },
                ),
                GoRoute(
                  path: 'food/:foodId',
                  builder: (context, state) {
                    final foodId = state.pathParameters['foodId'];
                    _logScreenView('View food details', parameters: {
                      'user_type': 'customer',
                      'screen_type': 'food_detail',
                    });
                    return FoodScreen(foodId: foodId!);
                  },
                ),
                GoRoute(
                  path: 'notifications',
                  builder: (context, state) {
                    _logScreenView('View notifications', parameters: {
                      'user_type': 'customer',
                      'screen_type': 'notifications',
                    });
                    return const NotificationsScreen();
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/reservations',
              builder: (context, state) {
                _logScreenView('View user reservations', parameters: {
                  'user_type': 'customer',
                  'screen_type': 'reservations',
                });
                return const ReservationScreen();
              },
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/recommendations',
              builder: (context, state) {
                _logScreenView('View recommendations', parameters: {
                  'user_type': 'customer',
                  'screen_type': 'recommendations',
                });
                return RecommendationView();
              },
            ),
          ],
        ),
      ],
    ),
  ],
);