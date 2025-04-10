import 'package:campus_bites/domain/entities/entities.dart';
import 'package:campus_bites/presentation/providers/restaurants/initial_loading_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurants_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';
import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_bites/config/router/app_router.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView> with WidgetsBindingObserver, RouteAware {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? _viewEntryTime;
  DateTime? _fetchStartTime; // Nuevo: Tiempo de inicio de carga
  bool _hasLoggedLoadTime = false; // Nuevo: Control para evitar múltiples logs
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  late final GoRouter _router;
  late String _currentLocation;
  bool _routerInitialized = false;
  bool _insideNestedRoute = false;

  @override
  void initState() {
    super.initState();
    _fetchStartTime = DateTime.now(); 
    // Register as an observer to detect app lifecycle changes
    WidgetsBinding.instance.addObserver(this);
    ref.read(getRestaurantsProvider.notifier).fetch();
    _viewEntryTime = DateTime.now();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final route = ModalRoute.of(context);
    if (route != null) {
      routeObserver.subscribe(this, route);
    }
    if (!_routerInitialized) {
      _router = GoRouter.of(context);
      _currentLocation = _router.routerDelegate.currentConfiguration.fullPath;
      _router.routerDelegate.addListener(_handleRouteChange);
      _routerInitialized = true;
    }
  }

  void _handleRouteChange() {
    final newLocation = _router.routerDelegate.currentConfiguration.fullPath;
    if (_currentLocation != newLocation) {
      // Navigated away from HomeView
      if (_currentLocation == '/') {
        _logTimeSpent(); // Leaving HomeView
      }
      if (newLocation == '/') {
        _viewEntryTime = DateTime.now(); // Entering HomeView again
      }
      _currentLocation = newLocation;
    } else {
      // It is a change between a nested route and HomeView
      if (!_insideNestedRoute) {
        _insideNestedRoute = true; // Set the flag to indicate that we are in a nested route
        _logTimeSpent(); // Leaving HomeView
      } else {
        _insideNestedRoute = false; // Reset the flag for future checks
        _viewEntryTime = DateTime.now(); // Entering HomeView again
      }
    }
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    WidgetsBinding.instance.removeObserver(this);
    if (_routerInitialized) {
      _router.routerDelegate.removeListener(_handleRouteChange);
    }
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    // Track when app goes to background
    if (state == AppLifecycleState.paused) {
      _logTimeSpent();
    } else if (state == AppLifecycleState.resumed) {
      // Only reset if we don't have an active timer and if we are back on the HomeView
      _currentLocation = _router.routerDelegate.currentConfiguration.fullPath;
      if (_currentLocation == '/' && !_insideNestedRoute) { 
        _viewEntryTime = DateTime.now();
      }
    }
  }

  void _logTimeSpent() {
    if (_viewEntryTime != null) {
      final DateTime exitTime = DateTime.now();
      final int timeSeconds = exitTime.difference(_viewEntryTime!).inSeconds;
      
      _analytics.logEvent(
        name: 'home_view_spent_time',
        parameters: {
          'time_seconds': timeSeconds,
        },
      );
      
      // Reset entry time after logging
      _viewEntryTime = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool initialLoading = ref.watch(initialLoadingProvider);
    final List<RestaurantEntity> restaurants = ref.watch(getRestaurantsProvider);

    if (!initialLoading && restaurants.isNotEmpty && !_hasLoggedLoadTime) {
      final duration = DateTime.now().difference(_fetchStartTime!).inMilliseconds;
      
      _analytics.logEvent(
        name: 'restaurant_load_time',
        parameters: {
          'duration_ms': duration,
        },
      );
      _hasLoggedLoadTime = true;
    }

    if (initialLoading) return const FullScreenLoader();

    const images = [
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
    ];
    
    return Scaffold(
      appBar: null,
      key: _scaffoldKey,
      drawer: CustomDrawer(
        closeDrawer: () => _scaffoldKey.currentState!.openEndDrawer(),
      ),
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                    alignment: Alignment.center,
                    child: SizedBox(
                        width: 314,
                        child: CustomTextFormField(
                          label: 'Search food',
                          filterTap: () =>
                              _scaffoldKey.currentState!.openDrawer(), onSubmitted: (query) {  },
                        ))),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _TagBox(images: images),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Column(
                    children: [
                      SizedBox(
                        width: 314,
                        child: Column(
                          children: [
                            _Title(title: 'Restaurants', subTitle: 'Near to you'),
                            ...restaurants.map((restaurant) {
                              return RestaurantCard(
                                title: restaurant.name,
                                rating: restaurant.rating.toString(),
                                distance: '200 meters',
                                imageUrl: restaurant.profilePhoto!,
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              },
              childCount: 1
              )
            )
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  final Function() closeDrawer;

  const CustomDrawer({
    super.key, required this.closeDrawer,
  });

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    return Drawer(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Food', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('All')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Meat')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Fish')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Chicken')
                        ]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              Text('Preferences', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('All')
                        ]),
                        Row(children: [
                          Checkbox(
                            value: false, 
                            onChanged: (value) {
                              analytics.logEvent(
                                name: 'dietary_filter',
                                parameters: {
                                  'dietary_filter': 'vegan'
                                }
                              ); 
                            }
                          ),
                          Text('Vegan')
                        ]),
                        Row(children: [
                         Checkbox(
                            value: false, 
                            onChanged: (value) {
                              analytics.logEvent(
                                name: 'dietary_filter',
                                parameters: {
                                  'dietary_filter': 'vegetarian'
                                }
                              ); 
                            }
                          ),
                          Text('Vegetarian')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      children: [
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                        Row(children: [
                          Checkbox(value: false, onChanged: (value) {}),
                          Text('Sample')
                        ]),
                      ],
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 48),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  FilledButton(
                    style: ButtonStyle(
                      visualDensity: VisualDensity.compact,
                      backgroundColor: WidgetStateProperty.all(Color(0xFFF46417)),
                      foregroundColor: WidgetStateProperty.all(Colors.white),
                      fixedSize: WidgetStateProperty.all(Size(180, 50)),
                      shape: WidgetStateProperty.all(
                        RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                    ),
                    onPressed: closeDrawer,
                    child: Text('Done'),
                  ),
                ],
              )
            ],
          ),
        ),
      )
    );
  }
}

class _TagBox extends StatelessWidget {
  const _TagBox({required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 314,
      child: GridView.builder(
        padding: EdgeInsets.zero,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          crossAxisSpacing: 8,
          mainAxisSpacing: 8,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              context.push('/tags/tagName$index');
            },
            child: SizedBox(
              width: 70,
              height: 70,
              child: Container(
                decoration: BoxDecoration(
                  color: Color(0xFFF9A825),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(4),
                    child: Image.network(
                      images[index % 4],
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({this.title, this.subTitle});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
        padding: const EdgeInsets.only(top: 10),
        margin: const EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: [
            if (title != null) Text(title!, style: titleStyle),
            const Spacer(),
            if (subTitle != null)
              FilledButton.tonal(
                style: ButtonStyle(
                  visualDensity: VisualDensity.compact,
                  backgroundColor: WidgetStatePropertyAll(Color(0xFFF46417)),
                  foregroundColor: WidgetStatePropertyAll(Colors.white),
                ),
                onPressed: () {},
                child: Text(
                  subTitle!,
                  style: TextStyle(color: Colors.white),
                ),
              )
          ],
        ));
  }
}