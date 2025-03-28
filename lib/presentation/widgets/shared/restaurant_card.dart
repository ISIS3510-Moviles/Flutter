import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';



class RestaurantCard extends StatelessWidget {
  final String title;
  final String rating;
  final String distance;
  final String imageUrl;

  const RestaurantCard({super.key, required this.title, required this.rating, required this.distance, required this.imageUrl});

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