import 'package:flutter/material.dart';
import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:campus_bites/presentation/views/views.dart';
import 'package:campus_bites/presentation/views/restaurant/reviews_tab.dart';
import 'package:campus_bites/presentation/views/restaurant/book_tab.dart';
import 'package:campus_bites/presentation/views/restaurant/food_tab.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  RestaurantScreenState createState() => RestaurantScreenState();
}

class RestaurantScreenState extends State<RestaurantScreen> with SingleTickerProviderStateMixin {
  late TabController tabController;
  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);
    tabController.addListener(() {
      setState(() {
        currentTabIndex = tabController.index;
      });
    });
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tabs = [
      DescriptionTab(),
      FoodTab(),
      BookTab(),
      Text('Directions'),
      ReviewsTab(),
    ];
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            CustomSliverAppbar(),

            SliverToBoxAdapter(
              child: SizedBox(
                height: 200,
                child: Image.network(
                  'https://media.licdn.com/dms/image/v2/D4E12AQH2ohujLI8ZMw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1726075580936?e=1747267200&v=beta&t=ybNo0EL4o7OlyDjPAsIpj6QRv4XOhgaDuPbcXJKoSGw',
                  fit: BoxFit.cover,
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
                              Text('Starbucks (Andes)', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                              Text('200 meters', style: TextStyle(fontSize: 18, color: Colors.grey)),
                            ],
                          ),
                          FilledButton(
                            style: ButtonStyle(
                              visualDensity: VisualDensity.compact,
                              backgroundColor: WidgetStateProperty.all(Color(0xFFF46417)),
                              foregroundColor: WidgetStateProperty.all(Colors.white),
                              fixedSize: WidgetStateProperty.all(Size(120, 50)),
                              shape: WidgetStateProperty.all(
                                RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                            onPressed: () {},
                            child: Text('Suscribe'),
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
