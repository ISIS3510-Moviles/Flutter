import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  final RestaurantEntity restaurant;

  const ReviewsTab(
    this.restaurant, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final comments = restaurant.comments;
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          if (comments == null || comments.isEmpty)
            const Text(
              'No reviews yet.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
            )
          else
            ...comments.map((comment) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ReviewCard(
                  name: comment.authorName,
                  date: comment.datetime,
                  review: comment.message,
                  rating: comment.rating,
                ),
              );
            }).toList(),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final DateTime date;
  final String review;
  final double rating;

  const ReviewCard({
    super.key,
    required this.name,
    required this.date,
    required this.review,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    name,
                    style: const TextStyle(
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                ),
                const SizedBox(width: 8),
                Text(
                  date.toIso8601String().split('T').first,
                  style: const TextStyle(
                    fontSize: 12.0,
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8.0),
            Row(
              children: List.generate(5, (index) {
                return Icon(
                  index < rating ? Icons.star : Icons.star_border,
                  color: Colors.amber,
                  size: 20,
                );
              }),
            ),
            const SizedBox(height: 8.0),
            Text(
              review,
              style: const TextStyle(fontSize: 14.0, color: Colors.black87),
              overflow: TextOverflow.ellipsis,
              maxLines: 3,
            ),
          ],
        ),
      ),
    );
  }
}
