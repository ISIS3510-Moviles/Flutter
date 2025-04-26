import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/presentation/providers/cache/restaurant_cache_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/single_restaurant_provider.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/views/views.dart';
import 'package:campus_bites/presentation/views/restaurant/reviews_tab.dart';
import 'package:campus_bites/presentation/views/restaurant/book_tab.dart';
import 'package:campus_bites/presentation/views/restaurant/food_tab.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:campus_bites/presentation/providers/restaurants/distance_cache_provider.dart';
import 'dart:async';
import 'package:firebase_analytics/firebase_analytics.dart';

class RestaurantScreen extends ConsumerStatefulWidget {
  final String restaurantId;

  const RestaurantScreen({super.key, required this.restaurantId});

  @override
  RestaurantScreenState createState() => RestaurantScreenState();
}

class RestaurantScreenState extends ConsumerState<RestaurantScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;
  String distanceText = 'Calculating...';
  bool isCalculatingDistance = true;
  String? lastCalculatedRestaurantId;
  StreamSubscription<Position>? _positionStreamSubscription;
  bool _mounted = true;
  final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

  @override
  void initState() {
    super.initState();
    _mounted = true;
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentTabIndex = tabController.index;
      });
    });
Future.microtask(() async {
  final restaurantCache = ref.read(restaurantCacheProvider);

  final cachedRestaurant = await restaurantCache.get(widget.restaurantId);
  if (cachedRestaurant != null) {
    print("Restaurant found in cache: ${cachedRestaurant.name}");
    ref.read(getSingleRestaurantProvider.notifier).setOne(cachedRestaurant);
  } else {
    print("Fetching restaurant from API...");
    await ref
        .read(getSingleRestaurantProvider.notifier)
        .fetchOne(widget.restaurantId);
    print("Fetching completed.");

    final fetchedList = ref.read(getSingleRestaurantProvider);
    print("Fetched list: $fetchedList");

    if (fetchedList.isNotEmpty) {
      final fetched = fetchedList.first;
      print("Fetched restaurant: ${fetched.name}");
      restaurantCache.put(widget.restaurantId, fetched);
    } else {
      print("No restaurant data found.");
    }
  }

  _initLocationAndDistanceIfNeeded();
});

  }

  void _initLocationAndDistanceIfNeeded() {
    if (lastCalculatedRestaurantId != widget.restaurantId) {
      lastCalculatedRestaurantId = widget.restaurantId;
      _initLocationAndDistance();
    }
  }

  void _initLocationAndDistance() async {
    _positionStreamSubscription?.cancel();

    final serviceEnabled = await Geolocator.isLocationServiceEnabled();
    final permissionGranted = await _requestLocationPermission();

    if (!serviceEnabled) {
      setState(() {
        distanceText = 'GPS is off';
        isCalculatingDistance = false;
      });
      return;
    }

    if (!permissionGranted) {
      setState(() {
        distanceText = 'Location denied';
        isCalculatingDistance = false;
      });
      return;
    }

    final locationSettings = LocationSettings(
      accuracy: LocationAccuracy.bestForNavigation,
      distanceFilter: 5,
    );

    _positionStreamSubscription = Geolocator.getPositionStream(
      locationSettings: locationSettings,
    ).listen(_updateDistance);
  }

  void _updateDistance(Position position) async {
    try {
      await Future.doWhile(() async {
        final restaurants = ref.read(getSingleRestaurantProvider);
        await Future.delayed(const Duration(milliseconds: 200));
        return restaurants.isEmpty;
      });

      final restaurants = ref.read(getSingleRestaurantProvider);
      RestaurantEntity? restaurant = restaurants.isNotEmpty ? restaurants.first : null;

      if (!_mounted) return;

      if (restaurant == null) {
        setState(() {
          distanceText = 'Not found';
          isCalculatingDistance = false;
        });
        return;
      }

      final distanceInMeters = Geolocator.distanceBetween(
        position.latitude,
        position.longitude,
        restaurant.latitude,
        restaurant.longitude,
      );

      ref
          .read(distanceCacheProvider.notifier)
          .setDistance(widget.restaurantId, distanceInMeters);

      if (!_mounted) return;

      setState(() {
        distanceText = distanceInMeters < 1000
            ? '${distanceInMeters.round()} meters'
            : '${(distanceInMeters / 1000).toStringAsFixed(1)} km';
        isCalculatingDistance = false;
      });
    } catch (e) {
      if (!_mounted) return;
      setState(() {
        distanceText = 'Not available';
        isCalculatingDistance = false;
      });
    }
  }

  @override
  void didUpdateWidget(covariant RestaurantScreen oldWidget) {
    super.didUpdateWidget(oldWidget);

    if (oldWidget.restaurantId != widget.restaurantId) {
      ref
          .read(getSingleRestaurantProvider.notifier)
          .fetchOne(widget.restaurantId);
      _initLocationAndDistanceIfNeeded();
    }
  }

  Future<bool> _requestLocationPermission() async {
    var status = await Permission.location.status;

    if (status.isDenied || status.isRestricted || status.isPermanentlyDenied) {
      status = await Permission.location.request();
    }

    return status.isGranted;
  }

  @override
  void dispose() {
    _mounted = false;
    _positionStreamSubscription?.cancel();
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final restaurants = ref.watch(getSingleRestaurantProvider);
    RestaurantEntity? restaurant = restaurants.isNotEmpty ? restaurants.first : null;

    List<Widget> tabs = [];
    if (restaurant == null) {
      for (var i = 0; i < 5; i++) {
        tabs.add(
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: const Text(
              'Could not access restaurant information.',
              style: TextStyle(color: Colors.red, fontSize: 16),
            ),
          ),
        );
      }
    } else {
      tabs = [
        DescriptionTab(restaurant),
        FoodTab(restaurant),
        BookTab(restaurant),
        ArriveTab(restaurant),
        ReviewsTab(restaurant),
      ];
    }

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                width: double.infinity,
                child: CachedNetworkImage(
                  imageUrl: restaurant?.profilePhoto ?? '',
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    child: CircularProgressIndicator(strokeWidth: 2),
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
                ),
              ),
            ),
            SliverAppBar(
              automaticallyImplyLeading: false,
              expandedHeight: 130,
              collapsedHeight: 130,
              pinned: true,
              flexibleSpace: Container(
                color: const Color(0xFFF5F5F5),
                child: Padding(
                  padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                restaurant?.name ?? 'Restaurant',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  isCalculatingDistance
                                      ? SizedBox(
                                          width: 12,
                                          height: 12,
                                          child: CircularProgressIndicator(
                                            strokeWidth: 2,
                                            valueColor:
                                                AlwaysStoppedAnimation<Color>(
                                                    Colors.grey),
                                          ),
                                        )
                                      : Icon(Icons.location_on,
                                          size: 16, color: Colors.grey),
                                  SizedBox(width: 4),
                                  Text(
                                    distanceText,
                                    style: TextStyle(
                                        fontSize: 18, color: Colors.grey),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          FilledButton(
                            style: ButtonStyle(
                              visualDensity: VisualDensity.compact,
                              backgroundColor:
                                  WidgetStateProperty.all(Color(0xFFF46417)),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white),
                              fixedSize: WidgetStateProperty.all(Size(120, 50)),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Subscribe'),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50,
                        child: TabBar(
                          controller: tabController,
                          tabs: [
                            Tab(icon: Icon(Icons.description_outlined)),
                            Tab(icon: Icon(Icons.menu_book_outlined)),
                            Tab(icon: Icon(Icons.calendar_month_outlined)),
                            Tab(icon: Icon(Icons.directions_outlined)),
                            Tab(icon: Icon(Icons.reviews_outlined)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => tabs[currentTabIndex],
                childCount: 1,
              ),
            ),
          ],
        ),
      ),
    );
  }
}