import 'package:campus_bites/presentation/widgets/shared/restaurant_card.dart';
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
                    child: CustomTextFormField(
                      label: 'Search food',
                    ))),
          ),
        ),
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(top: 16),
            child: Align(
              alignment: Alignment.topCenter,
              child: _TagBox(images: images),
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
                      _Title(title: 'Restaurants', subTitle: 'Near to you'),
                      RestaurantCard(
                        title: 'Starbucks (Andes)',
                        rating: '3.0',
                        distance: '200 meters',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
                      ),
                      RestaurantCard(
                        title: 'Starbucks (Andes)',
                        rating: '3.0',
                        distance: '200 meters',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
                      ),
                      RestaurantCard(
                        title: 'Starbucks (Andes)',
                        rating: '3.0',
                        distance: '200 meters',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
                      ),
                      RestaurantCard(
                        title: 'Starbucks (Andes)',
                        rating: '3.0',
                        distance: '200 meters',
                        imageUrl:
                            'https://cdn-icons-png.flaticon.com/512/16183/16183661.png',
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          );
        }, childCount: 1))
      ],
    );
  }
}

class _TagBox extends StatelessWidget {
  const _TagBox({required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
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
            return GestureDetector(
              onTap: () {context.push('/tags/tagName$index');},
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
                    child: Padding(
                      padding: const EdgeInsets.all(4),
                      child: Image.network(
                        images[index % 4],
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
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
