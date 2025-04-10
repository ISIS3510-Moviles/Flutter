import 'package:campus_bites/domain/entities/entities.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/presentation/providers/food_tags/food_tag_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/initial_loading_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurants_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';
import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_bites/config/router/app_router.dart';
import 'dart:async';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  HomeViewState createState() => HomeViewState();
}

class HomeViewState extends ConsumerState<HomeView>
    with WidgetsBindingObserver, RouteAware {
  final TextEditingController _searchController = TextEditingController();
  String _searchText = '';
  Timer? _searchDebounce;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  DateTime? _viewEntryTime;
  DateTime? _fetchStartTime;
  bool _hasLoggedLoadTime = false;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;
  late final GoRouter _router;
  late String _currentLocation;
  bool _routerInitialized = false;
  bool _insideNestedRoute = false;

  List<FoodTagEntity> _tags = [];

  @override
  void initState() {
    super.initState();
    _fetchStartTime = DateTime.now();

    WidgetsBinding.instance.addObserver(this);
    ref.read(getRestaurantsProvider.notifier).fetch();
    ref.read(getFoodTagsProvider.notifier).fetch();
    _fetchTags();
    _viewEntryTime = DateTime.now();
  }

  Future<void> _fetchTags() async {
    try {
      await ref.read(getFoodTagsProvider.notifier).fetch();
      final tags = ref.read(getFoodTagsProvider);
      setState(() {
        _tags = tags;
      });
    } catch (e) {
      print('Error fetching tags: $e');
    }
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
      if (_currentLocation == '/') {
        _logTimeSpent();
      }
      if (newLocation == '/') {
        _viewEntryTime = DateTime.now();
      }
      _currentLocation = newLocation;
    } else {
      if (!_insideNestedRoute) {
        _insideNestedRoute = true;
        _logTimeSpent();
      } else {
        _insideNestedRoute = false;
        _viewEntryTime = DateTime.now();
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
    if (state == AppLifecycleState.paused) {
      _logTimeSpent();
    } else if (state == AppLifecycleState.resumed) {
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
      _viewEntryTime = null;
    }
  }

  @override
  Widget build(BuildContext context) {
    final bool initialLoading = ref.watch(initialLoadingProvider);
    final List<RestaurantEntity> restaurants =
        ref.watch(getRestaurantsProvider);

    if (!initialLoading && restaurants.isNotEmpty && !_hasLoggedLoadTime) {
      final duration =
          DateTime.now().difference(_fetchStartTime!).inMilliseconds;

      _analytics.logEvent(
        name: 'restaurant_load_time',
        parameters: {
          'duration_ms': duration,
        },
      );
      _hasLoggedLoadTime = true;
    }

    if (initialLoading) return const FullScreenLoader();

    return Scaffold(
      appBar: null,
      key: _scaffoldKey,
      /* drawer: CustomDrawer(
        closeDrawer: () => _scaffoldKey.currentState!.openEndDrawer(),
      ), */
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            /* SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                      width: 314,
                      child: CustomTextFormField(
                        label: 'Search food',
                        controller:
                            _searchController,
                        onChanged: (value) {
                          _searchDebounce?.cancel();
                          _searchDebounce =
                              Timer(const Duration(seconds: 1), () {
                            setState(() {
                              _searchText = value;
                            });
                          });
                        },
                        filterTap: () =>
                            _scaffoldKey.currentState!.openDrawer(),
                        onSubmitted: (query) {},
                      )),
                ),
              ),
            ), */
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _TagBox(
                    tags: _tags,
                  ),
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
                            _Title(
                                title: 'Restaurants', subTitle: 'Near to you'),
                            ...restaurants.map((restaurant) {
                              return RestaurantCard(
                                title: restaurant.name,
                                rating: restaurant.rating.toString(),
                                distance: '200 meters',
                                imageUrl: restaurant.profilePhoto!,
                                tags: restaurant.tags ?? [],
                              );
                            })
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                    ],
                  ),
                );
              }, childCount: 1),
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
    super.key,
    required this.closeDrawer,
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
            Text(
              'Food',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
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
            Text(
              'Preferences',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
            ),
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
                                  parameters: {'dietary_filter': 'vegan'});
                            }),
                        Text('Vegan')
                      ]),
                      Row(children: [
                        Checkbox(
                            value: false,
                            onChanged: (value) {
                              analytics.logEvent(
                                  name: 'dietary_filter',
                                  parameters: {'dietary_filter': 'vegetarian'});
                            }),
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
    ));
  }
}

class _TagBox extends StatelessWidget {
  const _TagBox({required this.tags});

  final List<FoodTagEntity> tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: PageController(viewportFraction: 0.9),
        itemCount: (tags.length / 8).ceil(),
        itemBuilder: (context, pageIndex) {
          final startIndex = pageIndex * 8;
          final endIndex = (startIndex + 8).clamp(0, tags.length);
          final pageTags = tags.sublist(startIndex, endIndex);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pageTags
                      .take(4)
                      .map((tag) => _TagItem(tag: tag))
                      .toList(),
                ),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: pageTags
                      .skip(4)
                      .map((tag) => _TagItem(tag: tag))
                      .toList(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

class _TagItem extends StatelessWidget {
  const _TagItem({required this.tag});

  final FoodTagEntity tag;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push('/tags/${tag.id}');
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
            child: Center(
              child: Text(
                tag.name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                ),
              ),
            ),
          ),
        ),
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
