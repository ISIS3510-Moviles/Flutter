import 'package:campus_bites/presentation/widgets/shared/silver_list_food_restaurant.dart';
import 'package:campus_bites/presentation/widgets/shared/silver_tab_food_restaurant.dart';
import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';

class TagScreen extends StatefulWidget {
  final String tagName;
  const TagScreen({super.key, required this.tagName});

  @override
  TagScreenState createState() => TagScreenState();
}

class TagScreenState extends State<TagScreen>
    with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

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
                title: widget.tagName,
                imageUrl: 'https://as2.ftcdn.net/v2/jpg/01/16/61/93/1000_F_116619399_YA611bKNOW35ffK0OiyuaOcjAgXgKBui.jpg',
              ),
            ),
            SilverTabFoodRestaurant(tabController: tabController),
            SilverListFoodRestaurant(currentTabIndex: currentTabIndex,),
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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xFF277A46),
          borderRadius: BorderRadius.circular(20),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.network(
                imageUrl,
                width: 50,
                height: 50,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(width: 12),
            Text(
              title,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
