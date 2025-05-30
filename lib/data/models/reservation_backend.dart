class ReservationBackend {
  final String id;
  final DateTime date;
  final String time;
  final int numberComensals;
  final bool isCompleted;
  final bool? hasBeenCancelled;

  ReservationBackend({
    required this.id,
    required this.date,
    required this.time,
    required this.numberComensals,
    required this.isCompleted,
    this.hasBeenCancelled,
  });

  factory ReservationBackend.fromJson(Map<String, dynamic> json) {
    return ReservationBackend(
      id: json['id'],
      date: DateTime.parse(json['date']),
      time: json['time'],
      numberComensals: json['numberComensals'],
      isCompleted: json['isCompleted'],
      hasBeenCancelled: (json['hasBeenCancelled'] ?? false) as bool,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'date': date.toIso8601String(),
      'time': time,
      'numberComensals': numberComensals,
      'isCompleted': isCompleted,
    };
  }
}
