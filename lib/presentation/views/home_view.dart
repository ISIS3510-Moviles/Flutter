import 'package:campus_bites/presentation/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    const images = [
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
      'https://cdn-icons-png.flaticon.com/512/7184/7184115.png',
    ];
    return CustomScrollView(
      slivers: [
        CustomSliverAppbar(),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.center,
              child: SizedBox(
                width: 314,
                child: CustomTextFormField(label: 'Search food',)
              )
            ),
          ),
        ),

        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.topCenter,
              child: SizedBox(
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
                    return SizedBox(
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
                              images[index%4],
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        ),

        SliverList(delegate: SliverChildBuilderDelegate(
          (context, index) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Column(
                children: [
                  SizedBox(
                  width: 314,
                  child: Column(
                    children: [
                      _Title(title: 'Restaurants', subTitle: 'Near to you'),
                      
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',),
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',),
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',),
                      _CustomCard(title: 'Starbucks (Andes)', rating: '3.0', distance: '200 meters', imageUrl: 'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',)
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
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;
  final String? subTitle;

  const _Title({
    this.title,
    this.subTitle
  });

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 10),
      child: Row(
        children: [
          if (title != null)
            Text(title!, style: titleStyle),
          
          const Spacer(),
        
          if (subTitle != null)
            FilledButton.tonal(
              style: ButtonStyle(
                visualDensity: VisualDensity.compact,
                backgroundColor: WidgetStatePropertyAll(Color(0xFFF46417)),
                foregroundColor: WidgetStatePropertyAll(Colors.white),
              ),
              onPressed: () {},
              child: Text(subTitle!, style: TextStyle(color: Colors.white),),
            )
        ],
      )
    );
  }
}

class _CustomCard extends StatelessWidget {
  final String title;
  final String rating;
  final String distance;
  final String imageUrl;

  const _CustomCard({required this.title, required this.rating, required this.distance, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/restaurant'),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(12),
                child: Image.network(
                  imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                ),
              ),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.star_border_outlined, size: 18, color: Color(0xFFF9A825)),
                        SizedBox(width: 4),
                        Text(rating),
                      ],
                    ),
                    SizedBox(height: 4),
                    Row(
                      children: [
                        Icon(Icons.directions_walk, size: 18),
                        SizedBox(width: 4),
                        Text(distance),
                      ],
                    ),
                    SizedBox(height: 8),
                    Row(
                      children: [
                        _buildTag('Dinner'),
                        SizedBox(width: 8),
                        _buildTag('Breakfast'),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTag(String label) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: Color(0xFFF9A825),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
