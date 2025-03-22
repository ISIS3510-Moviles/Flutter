class CommentBackend {
  final String id;
  final DateTime datetime;
  final String message;
  final int rating;
  final int likes;
  final bool isVisible;
  final String authorId; 

  CommentBackend({
    required this.id,
    required this.datetime,
    required this.message,
    required this.rating,
    required this.likes,
    required this.isVisible,
    this.authorId = '0',
  });

  factory CommentBackend.fromJson(Map<String, dynamic> json) {
    return CommentBackend(
      id: json['id'],
      datetime: DateTime.parse(json['datetime']),
      message: json['message'],
      rating: json['rating'],
      likes: json['likes'],
      isVisible: json['isVisible'],
      authorId: json['authorId'] ?? '0',
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
    };
  }
}
