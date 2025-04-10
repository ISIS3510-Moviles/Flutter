import 'package:campus_bites/data/datasources/product_backend_datasource.dart';
import 'package:campus_bites/data/datasources/restaurant_backend_datasource.dart';
import 'package:campus_bites/data/mappers/product_mapper.dart';
import 'package:campus_bites/data/mappers/restaurant_mapper.dart';
import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/presentation/widgets/shared/sliver_list_food_restaurant.dart';
import 'package:campus_bites/presentation/widgets/shared/sliver_tab_food_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';

class TagScreen extends StatefulWidget {
  final String tagId;
  const TagScreen({super.key, required this.tagId});

  @override
  TagScreenState createState() => TagScreenState();
}

class TagScreenState extends State<TagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

  String tagName = '';
  List<Map<String, dynamic>> restaurants = [];
  List<Map<String, String>> products = [];

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
    try {
      final restaurantDatasource = RestaurantBackendDatasource();
      final productDatasource = ProductBackendDatasource();

      final restaurantData =
          await restaurantDatasource.getRestaurantsByTag(widget.tagId);
      final productData =
          await productDatasource.getProductsByTag(widget.tagId);

      if (mounted) {
        setState(() {
          tagName = (restaurantData['tagName'] as String?) ?? 'Unknown Tag';
          restaurants =
              restaurantData['restaurants'] as List<Map<String, dynamic>>;
          products = productData['products'] as List<Map<String, String>>;
        });
      }
    } catch (e, stackTrace) {
      print('Error fetching data: $e');
      print('Stack trace: $stackTrace');
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
                imageUrl:
                    'https://as2.ftcdn.net/v2/jpg/01/16/61/93/1000_F_116619399_YA611bKNOW35ffK0OiyuaOcjAgXgKBui.jpg',
              ),
            ),
            SilverTabFoodRestaurant(tabController: tabController),
            SilverListFoodRestaurant(
              currentTabIndex: currentTabIndex,
              restaurants: restaurants,
              foods: products,
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

  const _ImageBox({required this.imageUrl, required this.title});

  @override
  Widget build(BuildContext context) {
    final isNetworkImage = Uri.tryParse(imageUrl)?.hasAbsolutePath ?? false;

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
              child: isNetworkImage
                  ? Image.network(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    )
                  : Image.asset(
                      imageUrl,
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
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
