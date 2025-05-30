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

  final Set<String> seenDateTimes = {};

  for (var reservation in reservations) {
    try {
      final parts = reservation.date.split('/');
      if (parts.length != 3) {
        await reservation.delete();
        onReservationSent?.call("Invalid date format: ${reservation.date}");
        continue;
      }

      final month = int.tryParse(parts[0]);
      final day = int.tryParse(parts[1]);
      final year = int.tryParse(parts[2]);

      if (month == null || day == null || year == null) {
        await reservation.delete();
        onReservationSent?.call("Invalid date: ${reservation.date}");
        continue;
      }

      final timeParts = reservation.time.split(":");
      if (timeParts.length != 2) {
        await reservation.delete();
        onReservationSent?.call("Invalid time format: ${reservation.time}");
        continue;
      }

      final hour = int.tryParse(timeParts[0]);
      final minute = int.tryParse(timeParts[1]);

      if (hour == null || minute == null) {
        await reservation.delete();
        onReservationSent?.call("Invalid time: ${reservation.time}");
        continue;
      }

      final dateTimeKey = '${reservation.date}_${reservation.time}';

      if (seenDateTimes.contains(dateTimeKey)) {
        await reservation.delete();
        onReservationSent?.call("Reservation discarded: duplicate date and time.");
        continue;
      } else {
        seenDateTimes.add(dateTimeKey);
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
        await reservation.delete();
        onReservationSent?.call("Cannot send reservation: it is in the past.");
        continue;
      }

      if (difference.inHours < 6) {
        await reservation.delete();
        onReservationSent?.call("Cannot send reservation: must be at least 6 hours in advance.");
        continue;
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
