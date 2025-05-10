import 'package:campus_bites/domain/entities/comment_entity.dart';
import 'package:campus_bites/presentation/providers/comments/comment_repository_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getCommentsProvider = StateNotifierProvider<CommentNotifier, List<CommentEntity>>((ref) {
  final getComments = ref.watch(commentRepositoryProvider).getComments;

  return CommentNotifier(fetchComments: getComments);
});

typedef CommentCallback = Future<List<CommentEntity>> Function();

class CommentNotifier extends StateNotifier<List<CommentEntity>> {
  CommentCallback fetchComments;

  CommentNotifier({
    required this.fetchComments
  }) : super([]);

  Future<void> fetch() async {
    final List<CommentEntity> comments = await fetchComments();
    state = comments;
  }
}