class CommentBackend {
  final String id;
  final DateTime datetime;
  final String message;
  final double rating;
  final int likes;
  final bool isVisible;
  final String authorId;
  final String authorName;

  CommentBackend({
    required this.id,
    required this.datetime,
    required this.message,
    required this.rating,
    required this.likes,
    required this.isVisible,
    this.authorId = '0',
    this.authorName = 'anonymous',
  });

  factory CommentBackend.fromJson(Map<String, dynamic> json) {
    return CommentBackend(
      id: json['id'],
      datetime: DateTime.parse(json['datetime']),
      message: json['message'],
      rating: json['rating'] is double
          ? json['rating'] as double
          : (json['rating'] as num?)?.toDouble() ?? 0.0,
      likes: json['likes'],
      isVisible: json['isVisible'],
      authorId: json['authorId'] ?? '0',
      authorName: json['authorName'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'datetime': datetime.toIso8601String(),
      'message': message,
      'rating': rating,
      'likes': likes,
      'isVisible': isVisible,
      'authorId': authorId,
      'authorName': authorName
    };
  }
}
