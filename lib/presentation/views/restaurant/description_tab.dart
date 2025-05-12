import 'package:cached_network_image/cached_network_image.dart';
import 'package:campus_bites/domain/entities/entities.dart';
import 'package:flutter/material.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

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
            child: CachedNetworkImage(
              imageUrl: restaurant.overviewPhoto ?? '',
              fit: BoxFit.cover,
              placeholder: (context, url) => Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                child: CircularProgressIndicator(strokeWidth: 2),
              ),
              errorWidget: (context, url, error) {
                _analytics.logEvent(
                  name: 'image_load_error',
                  parameters: {
                    'image_url': url,
                    'error_message': error.toString(),
                    'timestamp': DateTime.now().toIso8601String(),
                  },
                );
                
                return Image.asset(
                  'assets/placeholder.png',
                  fit: BoxFit.cover,
                );
              },
            )
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