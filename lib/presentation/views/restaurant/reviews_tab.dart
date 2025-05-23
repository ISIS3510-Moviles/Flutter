import 'package:campus_bites/data/datasources/comment_backend_datasource.dart';
import 'package:campus_bites/data/offline/comment_queue_manager.dart';
import 'package:campus_bites/data/offline/queued_comment.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:flutter/material.dart';

class ReviewsTab extends StatelessWidget {
  final RestaurantEntity restaurant;

  const ReviewsTab(
    this.restaurant, {
    super.key,
  });

  void _openReviewForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: ReviewForm(
          restaurantId: restaurant.id,
          productId: '',
          authorId: GlobalUser().currentUser!.id,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final comments = restaurant.comments;

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          ElevatedButton.icon(
            onPressed: () => _openReviewForm(context),
            icon: const Icon(Icons.rate_review),
            label: const Text('Write a Review'),
            style: ElevatedButton.styleFrom(
              padding: const EdgeInsets.symmetric(vertical: 14),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              backgroundColor: Theme.of(context).primaryColor,
              foregroundColor: Colors.white,
            ),
          ),
          const SizedBox(height: 16),
          if (comments == null || comments.isEmpty)
            const Text(
              'No reviews yet.',
              style: TextStyle(fontSize: 16, color: Colors.grey),
              textAlign: TextAlign.center,
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
            }),
          const SizedBox(height: 32),
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

    final messenger = ScaffoldMessenger.of(context);
    final navigator = Navigator.of(context);

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

      navigator.pop();
      messenger.showSnackBar(
        const SnackBar(content: Text('Review submitted')),
      );
    } catch (e) {
      if (!mounted) return;

      final queuedComment = QueuedComment(
        message: _messageController.text.trim(),
        rating: _rating,
        photos: [],
        productId: widget.productId,
        restaurantId: widget.restaurantId,
        authorId: widget.authorId,
        createdAt: DateTime.now(),
      );

      final queueManager = CommentQueueManager();
      await queueManager.addToQueue(queuedComment);

      messenger.showSnackBar(
        const SnackBar(
          content: Text('No internet. Review saved and will be sent later.'),
        ),
      );
    } finally {
      if (mounted) setState(() => _isSubmitting = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 32),
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Leave a Review',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 24),
            TextFormField(
              controller: _messageController,
              decoration: InputDecoration(
                labelText: 'Your comment',
                hintText: 'Write your experience...',
                prefixIcon: const Icon(Icons.comment),
                filled: true,
                fillColor: Colors.grey.shade100,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              maxLines: 4,
              validator: (value) => value == null || value.isEmpty
                  ? 'Please write something'
                  : null,
            ),
            const SizedBox(height: 24),
            Column(
              children: [
                const Text('Your Rating',
                    style: TextStyle(fontWeight: FontWeight.w500)),
                const SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(5, (index) {
                    return IconButton(
                      icon: Icon(
                        index < _rating ? Icons.star : Icons.star_border,
                        color: Colors.amber,
                        size: 32,
                      ),
                      onPressed: () => setState(() => _rating = index + 1.0),
                    );
                  }),
                ),
              ],
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton.icon(
                onPressed: _isSubmitting ? null : _submitReview,
                icon: const Icon(Icons.send),
                label: _isSubmitting
                    ? const SizedBox(
                        height: 18,
                        width: 18,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      )
                    : const Text('Submit Review'),
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
