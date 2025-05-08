import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/data/offline/dietary_tag.dart';
import 'package:campus_bites/data/offline/food_tag.dart';
import 'package:campus_bites/domain/entities/dietary_tag_entity.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/presentation/providers/dietary-tags/dietary_tag_provider.dart';
import 'package:campus_bites/presentation/providers/food-tags/food_tag_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/initial_loading_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurants_provider.dart';
import 'package:campus_bites/presentation/views/custom_title.dart';
import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';
import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:campus_bites/config/router/app_router.dart';
import 'package:hive/hive.dart';

import 'dart:async';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_bites/presentation/providers/restaurants/distance_cache_provider.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

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
  late final GoRouter _router;
  late String _currentLocation;
  bool _routerInitialized = false;
  bool _insideNestedRoute = false;
  bool _isSearching = false;

  List<FoodTagEntity> _foodTags = [];
  List<DietaryTagEntity> _dietaryTags = [];

  @override
  void initState() {
    super.initState();
    _fetchStartTime = DateTime.now();

    WidgetsBinding.instance.addObserver(this);
    _loadUserPreferredTags().then((preferredTags) {
      ref
          .read(getRestaurantsProvider.notifier)
          .fetch(nameMatch: _searchText, tagsInclude: preferredTags);
    });
    ref.read(getFoodTagsProvider.notifier).fetchFood();
    ref.read(getDietaryTagsProvider.notifier).fetchDietary();
    fetchTags(
      ref: ref,
      onLoaded: (food, dietary) {
        setState(() {
          _foodTags = food;
          _dietaryTags = dietary;
        });
      },
    );
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
    const Widget _smallLoader = Center(
      child: SizedBox(
        width: 60,
        height: 60,
        child: CircularProgressIndicator(),
      ),
    );

    final bool initialLoading = ref.watch(initialLoadingProvider);
    final restaurantsAsync = ref.watch(getRestaurantsProvider);

    if (restaurantsAsync.isLoading) {
      if (initialLoading) {
        // loader inicial
        return _smallLoader;
      } else {
        // loader de filtro, pero con scaffold y drawer intactos
        return Scaffold(
          key: _scaffoldKey,
          drawer: CustomDrawer(closeDrawer: () => Navigator.of(context).pop()),
          body: SafeArea(
            child: CustomScrollView(
              slivers: [
                CustomSliverAppbar(),
                // en la zona donde irían los restaurantes, ponemos el loader pequeño
                SliverToBoxAdapter(child: _smallLoader),
              ],
            ),
          ),
        );
      }
    }

    if (restaurantsAsync.hasError) {
      return Text('Error');
    }
    final restaurants = restaurantsAsync.value ?? [];

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

    return Scaffold(
      appBar: null,
      key: _scaffoldKey,
      drawer: CustomDrawer(
        closeDrawer: () => context.go('/'),
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
                      label: 'Search restaurant',
                      controller: _searchController,
                      onChanged: (value) {
                        _searchDebounce?.cancel();
                        setState(() {
                          _isSearching = true;
                          _searchText = value;
                        });

                        _searchDebounce =
                            Timer(const Duration(seconds: 1), () async {
                          final preferredTags = await _loadUserPreferredTags();
                          await ref.read(getRestaurantsProvider.notifier).fetch(
                              nameMatch: value, tagsInclude: preferredTags);
                          setState(() {
                            _isSearching = false;
                          });
                        });
                      },
                      filterTap: () => _scaffoldKey.currentState!.openDrawer(),
                      onSubmitted: (query) {},
                    ),
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.only(top: 16),
                child: Align(
                  alignment: Alignment.topCenter,
                  child: _TagBox(tags: _foodTags),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: SizedBox(
                  width: 314,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if (_isSearching) ...[
                        const Center(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 40),
                            child: CircularProgressIndicator(),
                          ),
                        )
                      ] else if (restaurants.isEmpty) ...[
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 40),
                          child: Center(
                            child: Text(
                              'No restaurants found.',
                              style: TextStyle(fontSize: 16),
                            ),
                          ),
                        )
                      ] else ...[
                        ...restaurants.map((restaurant) {
                          final distanceMeters =
                              ref.watch(distanceCacheProvider)[restaurant.id] ??
                                  -1;
                          return RestaurantCard(
                            id: restaurant.id,
                            title: restaurant.name,
                            rating: restaurant.rating ?? 5,
                            distance: distanceMeters,
                            imageUrl: restaurant.profilePhoto!,
                            tags: restaurant.tags ?? [],
                            analytics: _analytics,
                          );
                        }),
                        const SizedBox(height: 20),
                      ]
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CustomDrawer extends ConsumerStatefulWidget {
  final Function() closeDrawer;

  const CustomDrawer({
    super.key,
    required this.closeDrawer,
  });

  @override
  _CustomDrawerState createState() => _CustomDrawerState();
}

class _CustomDrawerState extends ConsumerState<CustomDrawer> {
  Map<String, bool> foodTagSelections = {};
  Map<String, bool> dietaryTagSelections = {};
  List<FoodTagEntity> _foodTags = [];
  List<DietaryTagEntity> _dietaryTags = [];

  @override
  void initState() {
    super.initState();
    fetchTags(
      ref: ref,
      onLoaded: (food, dietary) {
        setState(() {
            _foodTags = food;
            _dietaryTags = dietary;
        });
        _loadPreferences(food, dietary);
      },
    );

  }

  Future<void> _clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    for (var entry in foodTagSelections.entries) {
      prefs.remove(entry.key);
    }
    for (var entry in dietaryTagSelections.entries) {
      prefs.remove(entry.key);
    }

    setState(() {
      foodTagSelections.updateAll((key, value) => false);
      dietaryTagSelections.updateAll((key, value) => false);
    });
  }

  Future<void> _loadPreferences(foodTags, dietaryTags) async {
    final prefs = await SharedPreferences.getInstance();


    setState(() {
      foodTagSelections = {
        for (var tag in foodTags) tag.name: prefs.getBool(tag.name) ?? false,
      };
      dietaryTagSelections = {
        for (var tag in dietaryTags) tag.name: prefs.getBool(tag.name) ?? false,
      };
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    for (var entry in foodTagSelections.entries) {
      prefs.setBool(entry.key, entry.value);
    }
    for (var entry in dietaryTagSelections.entries) {
      prefs.setBool(entry.key, entry.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;

    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: _foodTags.isEmpty && _dietaryTags.isEmpty
                ? Center(child: CircularProgressIndicator())
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Food tags',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: _foodTags
                                  .sublist(0, (_foodTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(
                                      tag.name, false, analytics))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: _foodTags
                                  .sublist((_foodTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(
                                      tag.name, false, analytics))
                                  .toList(),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 48),
                      Text(
                        'Dietary tags',
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              children: _dietaryTags
                                  .sublist(0, (_dietaryTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(
                                      tag.name, false, analytics))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: _dietaryTags
                                  .sublist((_dietaryTags.length / 2).ceil())
                                  .map((tag) =>
                                      _buildCheckbox(tag.name, true, analytics))
                                  .toList(),
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
                              backgroundColor:
                                  WidgetStateProperty.all(Color(0xFFF46417)),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              fixedSize: WidgetStateProperty.all(Size(140, 50)),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () async {
                              final searchText = context
                                      .findAncestorStateOfType<HomeViewState>()
                                      ?._searchText ??
                                  '';
                              await _savePreferences();
                              final preferredTags =
                                  await _loadUserPreferredTags();
                              await ref
                                  .read(getRestaurantsProvider.notifier)
                                  .fetch(
                                    nameMatch: searchText,
                                    tagsInclude: preferredTags,
                                  );
                              widget.closeDrawer();
                            },
                            child: Text('Done'),
                          ),
                          const SizedBox(width: 16),
                          TextButton(
                            onPressed: () async {
                              final searchText = context
                                      .findAncestorStateOfType<HomeViewState>()
                                      ?._searchText ??
                                  '';
                              await _clearPreferences();
                              final preferredTags =
                                  await _loadUserPreferredTags();
                              await ref
                                  .read(getRestaurantsProvider.notifier)
                                  .fetch(
                                    nameMatch: searchText,
                                    tagsInclude: preferredTags,
                                  );
                              widget.closeDrawer();
                            },
                            child: Text('Clear'),
                          ),
                        ],
                      ),
                    ],
                  ),
          ),
        ),
      ),
    );
  }

  Widget _buildCheckbox(
      String tagName, bool isDietary, FirebaseAnalytics analytics) {
    final map = isDietary ? dietaryTagSelections : foodTagSelections;
    return Row(
      children: [
        Checkbox(
          value: map[tagName] ?? false,
          onChanged: (value) {

            analytics.logEvent(
              name: 'filters_applied',
              parameters: {
                'user_id': GlobalUser().currentUser!.id,
              },
            );

            if (isDietary) {
              analytics.logEvent(
                name: 'dietary_filter',
                parameters: {'dietary_filter': tagName},
              );
            }
            
            setState(() {
              map[tagName] = value!;
            });
            _savePreferences();
          },
        ),
        Expanded(
          child: Text(
            tagName,
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            style: const TextStyle(fontSize: 14),
          ),
        ),
      ],
    );
  }
}

class _TagBox extends StatefulWidget {
  const _TagBox({required this.tags, Key? key}) : super(key: key);

  final List<FoodTagEntity> tags;

  @override
  State<_TagBox> createState() => _TagBoxState();
}

class _TagBoxState extends State<_TagBox> {
  late final PageController _pageController;
  late final int _totalPages;
  int _currentPage = 0;

  @override
  void initState() {
    super.initState();
    _totalPages = (widget.tags.length / 8).ceil();
    _pageController = PageController(initialPage: _currentPage, viewportFraction: 1.0);
  }

  void _goToPreviousPage() {
    final prevPage = (_currentPage - 1 + _totalPages) % _totalPages;
    _pageController.animateToPage(
      prevPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = prevPage);
  }

  void _goToNextPage() {
    final nextPage = (_currentPage + 1) % _totalPages;
    _pageController.animateToPage(
      nextPage,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
    setState(() => _currentPage = nextPage);
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: Stack(
        alignment: Alignment.center,
        children: [
          PageView.builder(
            controller: _pageController,
            itemCount: _totalPages,
            onPageChanged: (index) => setState(() => _currentPage = index),
            itemBuilder: (context, pageIndex) {
              final startIndex = pageIndex * 8;
              final endIndex = (startIndex + 8).clamp(0, widget.tags.length);
              final pageTags = widget.tags.sublist(startIndex, endIndex);

              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: pageTags.take(4).map((tag) => _TagItem(tag: tag)).toList(),
                    ),
                    const SizedBox(height: 12),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: pageTags.skip(4).map((tag) => _TagItem(tag: tag)).toList(),
                    ),
                  ],
                ),
              );
            },
          ),
          // Left Chevron
          Positioned(
            left: -2,
            child: IconButton(
              icon: const Icon(Icons.chevron_left, size: 32),
              onPressed: _goToPreviousPage,
            ),
          ),
          // Right Chevron
          Positioned(
            right: -2,
            child: IconButton(
              icon: const Icon(Icons.chevron_right, size: 32),
              onPressed: _goToNextPage,
            ),
          ),
        ],
      ),
    );
  }
}

class _TagItem extends StatelessWidget {
  const _TagItem({required this.tag});

  final FoodTagEntity tag;

  @override
  Widget build(BuildContext context) {
    final hasIcon = tag.icon != null && tag.icon!.isNotEmpty;

    return GestureDetector(
      onTap: () {
        context.push('/tags/${tag.id}');
      },
      child: Container(
        width: 72,
        height: 72,
        decoration: BoxDecoration(
          color: const Color(0xFFFFA726),
          borderRadius: BorderRadius.circular(16),
        ),
        padding: const EdgeInsets.all(6),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              flex: 2,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(8),
                child: hasIcon
                    ? CachedNetworkImage(
                        imageUrl: tag.icon!,
                        fit: BoxFit.cover,
                        placeholder: (context, url) => Container(
                          width: 80,
                          height: 80,
                          alignment: Alignment.center,
                          child: CircularProgressIndicator(
                            strokeWidth: 2,
                            color: Colors.white,
                          ),
                        ),
                        errorWidget: (context, url, error) {
                          // Log the error event to Firebase Analytics
                          _analytics.logEvent(
                            name: 'image_load_error',
                            parameters: {
                              'image_url': url,
                              'error_message': error.toString(),
                              'timestamp': DateTime.now().toIso8601String(),
                            },
                          );

                          // Return the placeholder image
                          return Image.asset(
                            'assets/placeholder.png',
                            fit: BoxFit.cover,
                          );
                        },
                      )
                    : Image.asset(
                        'assets/placeholder.png',
                        fit: BoxFit.cover,
                      ),
              ),
            ),
            const SizedBox(height: 4),
            Expanded(
              flex: 1,
              child: Text(
                tag.name,
                style: const TextStyle(
                  fontSize: 11,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}


Future<List<String>> _loadUserPreferredTags() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();
  final preferredTags = <String>[];

  for (var key in keys) {
    final value = prefs.get(key);
    if (value is bool && value == true) {
      preferredTags.add(key);
    }
  }
  return preferredTags;
}

Future<void> fetchTags({
  required WidgetRef ref,
  required Function(List<FoodTagEntity>, List<DietaryTagEntity>) onLoaded,
}) async {
  final foodBox = Hive.box<FoodTag>('food_tags');
  final dietaryBox = Hive.box<DietaryTag>('dietary_tags');
  final metaBox = Hive.box('meta');

  final lastFetch = metaBox.get('tags_last_fetch') as DateTime?;
  final now = DateTime.now();
  const cacheDuration = Duration(hours: 1);

  if (foodBox.isNotEmpty &&
      dietaryBox.isNotEmpty &&
      lastFetch != null &&
      now.difference(lastFetch) < cacheDuration) {
    final cachedFoodTags = foodBox.values.map((e) => e.toFood()).toList();
    final cachedDietaryTags =
        dietaryBox.values.map((e) => e.toDietary()).toList();
    onLoaded(cachedFoodTags, cachedDietaryTags);
    return;
  }

  try {
    await ref.read(getFoodTagsProvider.notifier).fetchFood();
    await ref.read(getDietaryTagsProvider.notifier).fetchDietaryTags();

    final freshFoodTags = ref.read(getFoodTagsProvider);
    final freshDietaryTags = ref.read(getDietaryTagsProvider);

    final hiveFoodTags = freshFoodTags.map((e) => e.toHiveFoodModel());
    final hiveDietaryTags = freshDietaryTags.map((e) => e.toHiveDietaryModel());

    await foodBox.clear();
    await foodBox.addAll(hiveFoodTags);
    await dietaryBox.clear();
    await dietaryBox.addAll(hiveDietaryTags);

    await metaBox.put('tags_last_fetch', now);

    onLoaded(freshFoodTags, freshDietaryTags);
  } catch (e) {
    if (foodBox.isNotEmpty && dietaryBox.isNotEmpty) {
      final fallbackFood = foodBox.values.map((e) => e.toFood()).toList();
      final fallbackDietary =
          dietaryBox.values.map((e) => e.toDietary()).toList();
      onLoaded(fallbackFood, fallbackDietary);
    }
  }
}