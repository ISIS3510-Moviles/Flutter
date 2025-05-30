import 'package:campus_bites/data/datasources/reservation_backend_datasource.dart';
import 'package:campus_bites/data/repositories/reservation_repository_impl.dart';
import 'package:campus_bites/domain/repositories/reservation_repository.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:hive/hive.dart';
import 'package:campus_bites/data/offline/queued_reservation_action.dart';

class ReservationActionQueueManager {
  ReservationActionQueueManager()
      : _box = Hive.box<QueuedReservationAction>('queued_reservation_actions'),
        _connectivity = Connectivity(),
        reservationRepository =
            ReservationRepositoryImpl(ReservationBackendDatasource());

  final Box<QueuedReservationAction> _box;
  final Connectivity _connectivity;
  final ReservationRepository reservationRepository;

  Future<void> addToQueue(QueuedReservationAction action) async {
    await _box.add(action);
    await _tryToSendQueuedActions();
  }

  void startListener({void Function(String)? onActionSent}) async {
    await _tryToSendQueuedActions(onActionSent: onActionSent);
    _connectivity.onConnectivityChanged.listen((status) async {
      if (status != ConnectivityResult.none) {
        await _tryToSendQueuedActions(onActionSent: onActionSent);
      }
    });
  }

  Future<void> _tryToSendQueuedActions({void Function(String)? onActionSent}) async {
    final connectivityResult = await _connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) return;

    final actions = _box.values.toList();

    for (final queued in actions) {
      try {
        if (queued.action == 'cancel') {
          await reservationRepository.cancelReservation(queued.reservationId);
          onActionSent?.call('Reservation cancelled successfully');
        } else {
          await reservationRepository.confirmReservation(queued.reservationId);
          onActionSent?.call('Reservation confirmed successfully');
        }
        await queued.delete();
      } catch (_) {
        // Podrías loggear errores si deseas
      }
    }
  }
}
