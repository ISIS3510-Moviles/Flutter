import 'package:campus_bites/presentation/widgets/shared/custom_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class FoodScreen extends StatelessWidget {
  final String foodId;
  const FoodScreen({super.key, required this.foodId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          const CustomSliverAppbar(),
          SliverToBoxAdapter(
            child: Align(
              alignment: Alignment.center,
              child: Image.network(
                'https://as1.ftcdn.net/v2/jpg/12/06/12/78/1000_F_1206127856_P7vsv48IxKa5cX8BRfBeUQHMh1phso5d.jpg',
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Wrap(
                    spacing: 10,
                    runSpacing: 10,
                    children: [
                      _buildTagChip(context, "Under \$20.000"),
                      _buildTagChip(context, "Breakfast"),
                      _buildTagChip(context, "Lunch"),
                      _buildTagChip(context, "Dinner"),
                      _buildTagChip(context, "Vegan"),
                      _buildTagChip(context, "Gluten-Free"),
                    ],
                  ),

                  const SizedBox(height: 10),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Tamale",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF277A46),
                        ),
                      ),
                      Text(
                        "\$40.000",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.red,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight.",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Ingredients",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF277A46),
                    ),
                  ),
                  const BulletPointList(items: [
                    "Shredded chicken Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight",
                    "Salsa verde (green tomatillo sauce) Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight ",
                    "Corn masa dough Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight",
                    "Corn husks Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight",
                    "Spices (cumin, garlic, chili powder, and more) Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight",
                  ]),
                  const SizedBox(height: 10),
                  const Text(
                    "Available Hours",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF277A46),
                    ),
                  ),
                  const Text(
                    "Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Our tamales are freshly made daily and available from 7:00 AM to 2:00 PM Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight Indulge in our mouthwatering Chicken Tamale, a traditional Colombian delight",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

Widget _buildTagChip(BuildContext context, String tagName) {
  return GestureDetector(
    onTap: () => context.push('/tags/tagName'),
    child: Chip(
      label: Text(tagName),
      backgroundColor: const Color(0xFFF9A825),
    ),
  );
}

class BulletPointList extends StatelessWidget {
  final List<String> items;
  const BulletPointList({required this.items, super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: items
          .map((item) => Padding(
                padding: const EdgeInsets.only(left: 8.0, bottom: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("• ", style: TextStyle(fontSize: 16)),
                    Expanded(
                        child:
                            Text(item, style: const TextStyle(fontSize: 16))),
                  ],
                ),
              ))
          .toList(),
    );
  }
}
