import 'package:campus_bites/domain/entities/comment_entity.dart';
import 'package:campus_bites/presentation/providers/comments/comment_provider.dart';
import 'package:campus_bites/presentation/providers/comments/initial_loading_provider.dart';
import 'package:campus_bites/presentation/widgets/shared/full_screen_loader.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


class ReviewsTab extends ConsumerStatefulWidget {
  const ReviewsTab({super.key});

  @override
  ReviewsTabState createState() =>ReviewsTabState();
}

class ReviewsTabState extends ConsumerState<ReviewsTab> {

  @override
  void initState() {
    super.initState();
    ref.read(getCommentsProvider.notifier).fetch();
  }

  @override
  Widget build(BuildContext context) {
    final bool initialLoading = ref.watch(initialLoadingProvider);
    if (initialLoading) return const FullScreenLoader();

    final List<CommentEntity> comments = ref.watch(getCommentsProvider);

    return SingleChildScrollView(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          const SizedBox(height: 16),
          ...comments.map((comment) => Padding(
                padding: const EdgeInsets.only(bottom: 16),
                child: ReviewCard(
                  name: comment.authorId.toString(),
                  date: comment.datetime,
                  review: comment.message,
                  rating: comment.rating,
                ),
              )),
        ],
      ),
    );
  }
}

class ReviewCard extends StatelessWidget {
  final String name;
  final DateTime date;
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
                  '${date.day}/${date.month}/${date.year}',
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
