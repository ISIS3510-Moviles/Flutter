class CommentEntity {
  final String id;
  final DateTime datetime;
  final String message;
  final int rating;
  final int likes;
  final bool isVisible;
  final String authorId;

  CommentEntity({
    required this.id,
    required this.datetime,
    required this.message,
    required this.rating,
    required this.likes,
    required this.isVisible,
    required this.authorId,
  });
}
