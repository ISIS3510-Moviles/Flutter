import 'package:cached_network_image/cached_network_image.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

class RestaurantCard extends StatelessWidget {
  final String id;
  final String title;
  final double rating;
  final double distance;
  final String imageUrl;
  final List<String> tags;

  const RestaurantCard({
    super.key,
    required this.id,
    required this.title,
    required this.rating,
    required this.distance,
    required this.imageUrl,
    required this.tags,
  });

  String formatDistance(double meters) {
    return meters < 1000
      ? '${meters.round()} m'
      : '${(meters / 1000).toStringAsFixed(1)} km';
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        _analytics.logEvent(
          name: 'restaurant_visit',
          parameters: {
            'restaurant_id': id,
            'restaurant_name': title,
          },
        );
        context.push('/restaurant/$id');
      },
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
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  width: 80,
                  height: 80,
                  fit: BoxFit.cover,
                  placeholder: (context, url) => Container(
                    width: 80,
                    height: 80,
                    alignment: Alignment.center,
                    child: const CircularProgressIndicator(strokeWidth: 2),
                  ),
                  errorWidget: (context, url, error) => Image.asset(
                    'assets/placeholder.png',
                    width: 80,
                    height: 80,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.star_border_outlined,
                            size: 18, color: Color(0xFFF9A825)),
                        const SizedBox(width: 4),
                        Text(rating.toString()),
                      ],
                    ),
                    const SizedBox(height: 4),
                    if (distance >= 0)
                      Row(
                        children: [
                          const Icon(Icons.directions_walk, size: 18),
                          const SizedBox(width: 4),
                          Text(formatDistance(distance)),
                        ],
                    ),
                    const SizedBox(height: 8),
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: tags.map((tag) => _buildTag(tag)).toList(),
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
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFFF9A825),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white, fontSize: 12),
      ),
    );
  }
}
