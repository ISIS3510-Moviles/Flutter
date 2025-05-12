import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:campus_bites/data/datasources/reservation_backend_datasource.dart';
import 'queued_reservation.dart';

class ReservationQueueManager {
  final _box = Hive.box<QueuedReservation>('queued_reservations');
  final _connectivity = Connectivity();

  Future<void> addToQueue(QueuedReservation reservation) async {
    await _box.add(reservation);
  }

Future<void> tryToSendQueuedReservations({
  void Function(String)? onReservationSent,
}) async {
  final connectivityResult = await _connectivity.checkConnectivity();
  if (connectivityResult == ConnectivityResult.none) return;

  final reservations = _box.values.toList();
  final now = DateTime.now();

  for (var reservation in reservations) {
    try {
      final parts = reservation.date.split('/');
      if (parts.length != 3) {
        throw Exception("Invalid date format: ${reservation.date}");
      }

      final month = int.tryParse(parts[0]);
      final day = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (month == null || day == null || year == null) {
        throw Exception("Invalid date: ${reservation.date}");
      }

      final timeParts = reservation.time.split(":");
      if (timeParts.length != 2) {
        throw Exception("Invalid time format: ${reservation.time}");
      }

      final hour = int.tryParse(timeParts[0]);
      final minute = int.tryParse(timeParts[1]);

      if (hour == null || minute == null) {
        throw Exception("Invalid time: ${reservation.time}");
      }

      final reservationDateTime = DateTime(
        year,
        month,
        day,
        hour,
        minute,
      );

      final difference = reservationDateTime.difference(now);

      if (difference.isNegative) {
        throw Exception("Cannot send reservation: it is in the past.");
      }

      if (difference.inHours < 6) {
        throw Exception("Cannot send reservation: must be at least 6 hours in advance.");
      }

      await ReservationBackendDatasource().createReservation(
        userId: reservation.userId,
        date: reservation.date,
        time: reservation.time,
        numberComensals: reservation.numberComensals,
        isCompleted: reservation.isCompleted,
        restaurantId: reservation.restaurantId,
      );

      await reservation.delete();
      onReservationSent?.call("Reservation sent successfully");
    } catch (e) {
      await reservation.delete();
      onReservationSent?.call(e.toString().replaceFirst('Exception: ', ''));
    }
  }
}

  void startListener({void Function(String)? onReservationSent}) {
    _connectivity.onConnectivityChanged.listen((event) {
      if (event != ConnectivityResult.none) {
        tryToSendQueuedReservations(onReservationSent: onReservationSent);
      }
    });
  }
}
