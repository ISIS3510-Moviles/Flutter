import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:campus_bites/data/datasources/comment_backend_datasource.dart';
import 'queued_comment.dart';

class CommentQueueManager {
  final _box = Hive.box<QueuedComment>('queued_comments');
  final _connectivity = Connectivity();

  Future<void> addToQueue(QueuedComment comment) async {
    await _box.add(comment);
  }

  Future<void> tryToSendQueuedComments() async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return;

    final comments = _box.values.toList();
    for (var comment in comments) {
      try {
        await CommentBackendDatasource().createComment(
          message: comment.message,
          rating: comment.rating,
          photos: [],
          productId: comment.productId,
          restaurantId: comment.restaurantId,
          authorId: comment.authorId,
        );
        await comment.delete();
      } catch (_) {
        break;
      }
    }
  }

  void startListener() {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        tryToSendQueuedComments();
      }
    });
  }
}
