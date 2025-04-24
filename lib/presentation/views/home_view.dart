import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/domain/entities/entities.dart';
import 'package:campus_bites/domain/entities/food_tag_entity.dart';
import 'package:campus_bites/presentation/providers/dietary-tags/dietary_tag_provider.dart';
import 'package:campus_bites/presentation/providers/food-tags/food_tag_provider.dart';
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

import 'package:shared_preferences/shared_preferences.dart';
import 'package:campus_bites/presentation/providers/restaurants/distance_cache_provider.dart';

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
  bool _isSearching = false;

  List<FoodTagEntity> _tags = [];

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
    _fetchTags();
    _viewEntryTime = DateTime.now();
  }

  Future<void> _fetchTags() async {
    try {
      await ref.read(getFoodTagsProvider.notifier).fetchFood();
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
                  child: _TagBox(tags: _tags),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: SizedBox(
                  width: 314,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const _Title(
                          title: 'Restaurants', subTitle: 'Near to you'),
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
                            ref.watch(distanceCacheProvider)[restaurant.id] ?? -1;
                          return RestaurantCard(
                            id: restaurant.id,
                            title: restaurant.name,
                            rating: restaurant.rating ?? 5,
                            distance: distanceMeters,
                            imageUrl: restaurant.profilePhoto!,
                            tags: restaurant.tags ?? [],
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
  Map<String, bool> tagSelections = {};

  @override
  void initState() {
    super.initState();
    _loadPreferences();
  }

  Future<void> _clearPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    setState(() {
      tagSelections.updateAll((key, value) => false);
    });
  }

  Future<void> _loadPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    final foodTags = ref.read(getFoodTagsProvider);
    final dietaryTags = ref.read(getDietaryTagsProvider);

    Map<String, bool> initialSelections = {
      for (var tag in foodTags) tag.name: prefs.getBool(tag.name) ?? false,
      for (var tag in dietaryTags) tag.name: prefs.getBool(tag.name) ?? false,
    };

    setState(() {
      tagSelections = initialSelections;
    });
  }

  Future<void> _savePreferences() async {
    final prefs = await SharedPreferences.getInstance();
    for (var entry in tagSelections.entries) {
      prefs.setBool(entry.key, entry.value);
    }
  }

  @override
  Widget build(BuildContext context) {
    final FirebaseAnalytics analytics = FirebaseAnalytics.instance;
    final foodTags = ref.watch(getFoodTagsProvider);
    final dietaryTags = ref.watch(getDietaryTagsProvider);

    return Drawer(
      child: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
            child: foodTags.isEmpty
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
                              children: foodTags
                                  .sublist(0, (foodTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(tag.name))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: foodTags
                                  .sublist((foodTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(tag.name))
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
                              children: dietaryTags
                                  .sublist(0, (dietaryTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(tag.name, analytics, true))
                                  .toList(),
                            ),
                          ),
                          Expanded(
                            child: Column(
                              children: dietaryTags
                                  .sublist((dietaryTags.length / 2).ceil())
                                  .map((tag) => _buildCheckbox(tag.name, analytics, true))
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

  Widget _buildCheckbox(String tagName, [analytics, dietary]) {
    return Row(
      children: [
        Checkbox(
          value: tagSelections[tagName] ?? false,
          onChanged: (value) {
            if (dietary == true) {
              analytics.logEvent(
                name: 'dietary_filter',
                parameters: {
                  'dietary_filter': tagName
                }
              ); 
            }
            setState(() {
              tagSelections[tagName] = value!;
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

class _TagBox extends StatelessWidget {
  const _TagBox({required this.tags});

  final List<FoodTagEntity> tags;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      child: PageView.builder(
        controller: PageController(viewportFraction: 1.0),
        itemCount: (tags.length / 8).ceil(),
        itemBuilder: (context, pageIndex) {
          final startIndex = pageIndex * 8;
          final endIndex = (startIndex + 8).clamp(0, tags.length);
          final pageTags = tags.sublist(startIndex, endIndex);

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: pageTags
                      .take(4)
                      .map((tag) => _TagItem(tag: tag))
                      .toList(),
                ),
                const SizedBox(height: 12),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                          child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white,),
                        ),
                        errorWidget: (context, url, error) => Image.asset(
                          'assets/placeholder.png',
                          fit: BoxFit.cover,
                        ),
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
      ),
    );
  }
}

Future<List<String>> _loadUserPreferredTags() async {
  final prefs = await SharedPreferences.getInstance();
  final keys = prefs.getKeys();
  final preferredTags = <String>[];

  for (var key in keys) {
    if (prefs.getBool(key) == true) {
      preferredTags.add(key);
    }
  }
  return preferredTags;
}
