import 'package:campus_bites/domain/entities/entities.dart';
import 'package:flutter/material.dart';

class DescriptionTab extends StatelessWidget {
  final RestaurantEntity restaurant;
  const DescriptionTab(
    this.restaurant, {
    super.key,
  });


  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            height: 200,
            width: double.infinity,
            child: Image.network(
              restaurant.overviewPhoto ?? '',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Image.asset(
                  'assets/placeholder.png',
                  fit: BoxFit.cover,
                );
              },
            ),
          ),
          const SizedBox(height: 16),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Description',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 8),
          Text(
            restaurant.description,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }
}