class ReservationBackend {
  final String id;
  final DateTime date;
  final DateTime time;
  final int numberComensals;
  final bool isCompleted;

  ReservationBackend({
    required this.id,
    required this.date,
    required this.time,
    required this.numberComensals,
    required this.isCompleted,
  });

  factory ReservationBackend.fromJson(Map<String, dynamic> json) {
    return ReservationBackend(
      id: json['id'],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      numberComensals: json['numberComensals'],
      isCompleted: json['isCompleted'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'numberComensals': numberComensals,
      'isCompleted': isCompleted,
    };
  }
}
