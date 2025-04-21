class CommentEntity {
  final String id;
  final DateTime datetime;
  final String message;
  final double rating;
  final int likes;
  final bool isVisible;
  final String authorId;
  final String authorName;

  CommentEntity({
    required this.id,
    required this.datetime,
    required this.message,
    required this.rating,
    required this.likes,
    required this.isVisible,
    required this.authorId,
    required this.authorName,
  });
}
