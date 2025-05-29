import 'package:campus_bites/domain/entities/product_entity.dart';
import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:campus_bites/presentation/widgets/shared/food_card.dart';

class ResponsiveFoodList extends StatelessWidget {
  const ResponsiveFoodList({
    super.key,
    required this.food,
  });

  final List<ProductEntity> food;

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        return SizedBox(
          child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              mainAxisExtent: 260,
              crossAxisCount:
                  (sizingInformation.localWidgetSize.width / 250).round(),
            ),
            itemCount: food.length,
            itemBuilder: (context, index) {
              final item = food[index];
              return FoodCard(
                id: item.id,
                imageUrl: item.photo ?? '',
                title: item.name,
                price: item.price,
                subtitle: item.description,
              );
            },
          ),
        );
      },
    );
  }
}
