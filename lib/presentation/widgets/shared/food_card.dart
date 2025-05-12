import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_analytics/firebase_analytics.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

class FoodCard extends StatelessWidget {
  final String id;
  final String imageUrl;
  final String title;
  final double price;
  final String subtitle;
  
  const FoodCard({
    super.key,
    required this.id,
    required this.imageUrl,
    required this.title,
    required this.price,
    this.subtitle = '',
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.push('/food/$id'),
      child: Card(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: CachedNetworkImage(
                      imageUrl: imageUrl,
                      height: 130,
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
                          height: 130,
                          fit: BoxFit.cover,
                        );
                      },
                    )),
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      title,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '\$$price',
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 6),
                    subtitle.isNotEmpty
                        ? Text(
                            subtitle,
                            maxLines: 1,
                            style: const TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                            ),
                          )
                        : const SizedBox(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
