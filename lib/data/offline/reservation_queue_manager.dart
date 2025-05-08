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

  Future<void> tryToSendQueuedReservations(
      {void Function(String)? onReservationSent}) async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return;

    final reservations = _box.values.toList();
    for (var reservation in reservations) {
      try {
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
      } catch (_) {
        break;
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
