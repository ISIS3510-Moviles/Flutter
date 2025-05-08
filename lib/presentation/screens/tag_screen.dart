import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/domain/entities/entities.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/presentation/providers/food-tags/food_tag_provider.dart';
import 'package:campus_bites/presentation/providers/products/product_provider.dart';
import 'package:campus_bites/presentation/providers/restaurants/restaurants_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/sliver_list_food_restaurant.dart';
import 'package:campus_bites/presentation/widgets/shared/sliver_tab_food_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

class TagScreen extends ConsumerStatefulWidget {
  final String tagId;
  const TagScreen({super.key, required this.tagId});

  @override
  ConsumerState<TagScreen> createState() => TagScreenState();
}



class TagScreenState extends ConsumerState<TagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

  String tagName = '';
  String tagIcon = ''; 
  List<RestaurantEntity> restaurants = [];
  List<ProductEntity> products = [];
  bool hasError = false;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
    tabController.addListener(() {
      if (mounted) {
        setState(() {
          currentTabIndex = tabController.index;
        });
      }
    });

    _fetchData();
  }

Future<void> _fetchData() async {
  setState(() {
    hasError = false;
    isLoading = true;
    tagName = '';
    tagIcon = '';
    restaurants = [];
    products = [];
  });

  try {
    final restaurantProvider =  ref.read(getRestaurantsProvider.notifier);
    final productNotifier = ref.read(getProductsProvider.notifier);
    final tagNotifier = ref.read(getFoodTagsProvider.notifier);

    final restaurantFuture = restaurantProvider.fetchByTag(widget.tagId);
    final productFuture = productNotifier.fetchByTag(widget.tagId);
    final tagFuture = tagNotifier.fetchById(widget.tagId);

    final restaurantData = await restaurantFuture;
    final productData = await productFuture;
    final tagData = await tagFuture;

    if (mounted && tagData != null) {
      setState(() {
        tagName = tagData.name;
        tagIcon = tagData.icon ?? '';
        restaurants = restaurantData;
        products = productData;
        hasError = false;
        isLoading = false;
      });
    } else {
      setState(() {
        hasError = true;
        isLoading = false;
      });
    }
  } on TimeoutException {
    if (mounted) {
      setState(() {
        tagName = 'Error: request timed out';
        hasError = true;
        isLoading = false;
      });
    }
  } catch (e) {
    if (mounted) {
      setState(() {
        tagName = 'Error loading data';
        hasError = true;
        isLoading = false;
      });
    }
  }
}

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),
            SliverToBoxAdapter(
              child: _ImageBox(
                title: tagName.isNotEmpty ? tagName : 'Loading...',
                imageUrl: tagIcon,
              ),
            ),
            if (isLoading)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(32.0),
                  child: Center(child: CircularProgressIndicator()),
                ),
              )
            else if (!hasError) ...[
              SilverTabFoodRestaurant(tabController: tabController),
              SilverListFoodRestaurant(
                currentTabIndex: currentTabIndex,
                restaurants: restaurants,
                foods: products,
              ),
            ] else
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        'There was an error loading the data.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 12),
                      ElevatedButton.icon(
                        onPressed: _fetchData,
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF277A46),
                          foregroundColor: Colors.white,
                          padding: const EdgeInsets.symmetric(
                            horizontal: 24,
                            vertical: 12,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class _ImageBox extends StatelessWidget {
  final String title;
  final String imageUrl;
  final String placeholder = 'assets/placeholder.png';  
  const _ImageBox({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: const Color(0xFF277A46),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: imageUrl,
                width: 50,
                height: 50,
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
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    );
                  },
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
