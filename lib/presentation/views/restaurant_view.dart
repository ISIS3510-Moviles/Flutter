import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';

class RestaurantView extends StatelessWidget {
  const RestaurantView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 5,
      child: CustomScrollView(
        slivers: [
          CustomSliverAppbar(),

          // Imagen
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                'https://media.licdn.com/dms/image/v2/D4E12AQH2ohujLI8ZMw/article-cover_image-shrink_720_1280/article-cover_image-shrink_720_1280/0/1726075580936?e=1747267200&v=beta&t=ybNo0EL4o7OlyDjPAsIpj6QRv4XOhgaDuPbcXJKoSGw',
                fit: BoxFit.cover,
              ),
            ),
          ),

          SliverToBoxAdapter(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Starbucks (Andes)', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                      Text('200 meters', style: TextStyle(fontSize: 18, color: Colors.grey)),
                    ],
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      backgroundColor: Color(0xFFF46417),
                    ),
                    onPressed: () {},
                    child: Text('Suscribe', style: TextStyle(color: Colors.white),),
                  ),
                ),
              ],
            ),
          ),

          SliverList(delegate: SliverChildBuilderDelegate(
            (context, index) => _TabContent(),
            childCount: 1,
          ))

        ],
      ),
    );
  }
}

class _TabContent extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

        SizedBox(
          height: 50,
          child: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.description_outlined),),
              Tab(icon: Icon(Icons.menu_book_outlined),),
              Tab(icon: Icon(Icons.calendar_month_outlined),),
              Tab(icon: Icon(Icons.directions_outlined),),
              Tab(icon: Icon(Icons.reviews_outlined),),
            ],
          ),
        ),

        SizedBox(
          height: 500,
          child: TabBarView(
            children: [
              _DescriptionTab(),
              _DescriptionTab(),
              _DescriptionTab(),
              _DescriptionTab(),
              _DescriptionTab(),
            ],
          ),
        )
      ],
    );
  }
}

class _DescriptionTab extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 16),
            Align(
              alignment: Alignment.center,
              child: Image.network(
                'https://s3-alpha-sig.figma.com/img/2465/79c4/2f36a800c8e14d953b6b318b4992b62a?Expires=1742169600&Key-Pair-Id=APKAQ4GOSFWCW27IBOMQ&Signature=HIStLARCdA-oGuNA5Hhc4FxX0l0pCu2a9a-5Q-m~QrA8SMPL5SdzTVzKtw2nqsP7ycdcXUsm-OB210C09R69MCJ7VE6dggpDqAMiTh2yGM8qZ4IrzWWo8~VLu8wN5D6onRBM~hoI~x79gotOvvDfhk3KC47Z99lxCN9dYALLSQc10kRuRNeqT31ibGwIBPRd88bcfctZODQpAEtLzZu-qfVlBC9EFgSOc4BQDox1WcjKDdnc2RIFkhQ9sKVEMfTOIALnfo-z1ZYHehd5zcgjWaKuL7YwmC1QiR3NGYOixeDPxV13NsrzItBMKM5idvSlvJWuacLd6cI11lmAXtbZrg__',
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(height: 16),
            Text('Description', style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            SizedBox(height: 16),
            Text('Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur Lorem ipsum dolor sit amet, consectetur adipiscing elit sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.', style: TextStyle(fontSize: 18)),
            SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}