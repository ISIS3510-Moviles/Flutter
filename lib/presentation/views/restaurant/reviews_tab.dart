import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {

  const ReviewsTab({super.key});
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
                    SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
                    SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
                    SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
                    SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
                    SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          SizedBox(height: 16),
          ReviewCard(
            name: "Wilmer",
            date: "31/01/2025",
            review: "Lorem ipsum dolor sit amet consectetur adipiscing elit...",
            rating: 3,
          ),
          
        ],
      ),
    );
  }
}
class ReviewCard extends StatelessWidget {
  final String name;
  final String date;
  final String review;
  final int rating;

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
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  date,
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
                );
              }),
            ),
            const SizedBox(height: 8.0),
            Text(
              review,
              style: const TextStyle(fontSize: 14.0, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}