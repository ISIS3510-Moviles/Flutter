
import 'package:campus_bites/data/datasources/comment_backend_datasource.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
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

class ReviewForm extends StatefulWidget {
  final String restaurantId;
  final String productId;
  final String authorId;

  const ReviewForm({
    super.key,
    required this.restaurantId,
    required this.productId,
    required this.authorId,
  });

  @override
  State<ReviewForm> createState() => _ReviewFormState();
}

class _ReviewFormState extends State<ReviewForm> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _messageController = TextEditingController();
  double _rating = 0.0;

  bool _isSubmitting = false;

  void _submitReview() async {
    if (!_formKey.currentState!.validate() || _rating == 0) return;

    setState(() => _isSubmitting = true);

    try {
      final commentDatasource = CommentBackendDatasource();
      await commentDatasource.createComment(
        message: _messageController.text.trim(),
        rating: _rating,
        photos: [],
        productId: widget.productId,
        restaurantId: widget.restaurantId,
        authorId: widget.authorId,
      );

      if (!mounted) return;

      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Review submitted')),
      );
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to submit review: $e')),
      );
    } finally {
      if (mounted) {
        setState(() => _isSubmitting = false);
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Write your review',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              decoration: const InputDecoration(
                labelText: 'Comment',
                border: OutlineInputBorder(),
              ),
              maxLines: 3,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please write something'
                  : null,
            ),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    double starValue = index + 1;
                    IconData icon;

                    if (_rating >= starValue) {
                      icon = Icons.star;
                    } else if (_rating >= starValue - 0.75) {
                      icon = Icons.star_half;
                    } else {
                      icon = Icons.star_border;
                    }

                    return Icon(icon, color: Colors.amber, size: 32);
                  }),
                ),
                Slider(
                  value: _rating,
                  min: 0,
                  max: 5,
                  divisions: 50,
                  label: _rating.toStringAsFixed(1),
                  onChanged: (value) => setState(() => _rating = value),
                  activeColor: Colors.amber,
                ),
              ],
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: _isSubmitting ? null : _submitReview,
              child: _isSubmitting
                  ? const CircularProgressIndicator()
                  : const Text('Submit'),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}
