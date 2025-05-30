import 'package:campus_bites/data/offline/reservation_queue_manager.dart';
import 'package:campus_bites/data/offline/queued_reservation.dart';
import 'package:campus_bites/domain/entities/pending_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:campus_bites/data/datasources/reservation_backend_datasource.dart';
import 'package:campus_bites/globals/GlobalUser.dart';
import 'package:campus_bites/presentation/providers/alerts/alert_provider.dart';
import 'package:campus_bites/presentation/providers/reservations/reservation_provider.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/intl.dart';

final FirebaseAnalytics _analytics = FirebaseAnalytics.instance;

class BookTab extends ConsumerStatefulWidget {
  final RestaurantEntity restaurant;
  const BookTab(
    this.restaurant, {
    super.key,
  });

  @override
  ConsumerState<BookTab> createState() => BookTabState();
}

class BookTabState extends ConsumerState<BookTab> {
  late ReservationEntity reservation;
  final FocusNode _comensalsFocusNode = FocusNode();
  late TextEditingController _dateController;
  late TextEditingController _comensalsController;

  final ReservationBackendDatasource _datasource =
      ReservationBackendDatasource();

  @override
  void initState() {
    super.initState();
    
    DateTime now = DateTime.now();
    String formattedDate = DateFormat('MM/dd/yyyy').format(now);
    
    String initialTime = _isToday(formattedDate) ? "17:00" : "12:00";
    
    reservation = ReservationEntity(
      id: "1",
      date: formattedDate,
      time: initialTime,
      numberComensals: 1,
      state: PendingState(),
    );
    
    _dateController = TextEditingController(text: reservation.date);
    _comensalsController = TextEditingController(text: reservation.numberComensals.toString());
  }

  bool _isToday(String dateString) {
    DateTime date = DateFormat('MM/dd/yyyy').parse(dateString);
    DateTime now = DateTime.now();
    return date.day == now.day && date.month == now.month && date.year == now.year;
  }

  @override
  void dispose() {
    _comensalsFocusNode.dispose();
    _dateController.dispose();
    _comensalsController.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateFormat('MM/dd/yyyy').parse(reservation.date),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      String newDate = DateFormat('MM/dd/yyyy').format(picked);
      bool isToday = _isToday(newDate);
      
      setState(() {
        reservation.date = newDate;
        _dateController.text = reservation.date;
        
        reservation.time = isToday ? "17:00" : "12:00";
      });
    }
  }

Future<void> _bookReservation() async {
  final userId = GlobalUser().currentUser?.id;

  if (userId == null) {
    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('User not logged in. Please log in to make a reservation.'),
        ),
      );
    }
    return;
  }

  try {
    await _datasource.createReservation(
      userId: userId,
      date: reservation.date,
      time: reservation.time,
      numberComensals: reservation.numberComensals,
      isCompleted: false,
      restaurantId: widget.restaurant.id,
    );

    _analytics.logEvent(
      name: 'reservation_created',
      parameters: {
        'user_id': userId,
        'restaurant_id': widget.restaurant.id,
        'date': reservation.date,
        'time': reservation.time,
        'number_comensals': reservation.numberComensals,
      },
    );
    
    ref.invalidate(getReservationsProvider(userId));
    ref.invalidate(getAlertsProvider(userId));

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Reservation created successfully!')),
      );
    }
  } catch (e) {
    if (e.toString().contains('cannot be in the past')) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(e.toString().replaceAll('Exception: ', '')),
          ),
        );
      }
    } else {
      final manager = ReservationQueueManager();
      await manager.addToQueue(
        QueuedReservation(
          id: reservation.id,
          userId: GlobalUser().currentUser!.id,
          date: reservation.date,
          time: reservation.time,
          numberComensals: reservation.numberComensals,
          isCompleted: false,
          restaurantId: widget.restaurant.id,
        ),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('No internet. Reservation saved and will be sent later.'),
          ),
        );
      }
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Date:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF277A46))),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: const OutlineInputBorder(),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF817570), width: 1.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Hour:",
                style: TextStyle(
                  fontWeight: FontWeight.bold, 
                  fontSize: 16,
                  color: Color(0xFF277A46))),
            DropdownButtonFormField<String>(
              value: reservation.time,
              items: _isToday(reservation.date)
                  ? ["17:00", "18:00", "19:00", "20:00", "21:00", "22:00", "23:00"].map((hour) {
                      return DropdownMenuItem(
                        value: hour,
                        child: Text(hour),
                      );
                    }).toList()
                  : ["12:00", "13:00", "14:00", "15:00", "16:00"].map((hour) {
                      return DropdownMenuItem(
                        value: hour,
                        child: Text(hour),
                      );
                    }).toList(),
              onChanged: (value) {
                setState(() {
                  reservation.time = value!;
                });
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Color(0xFF817570), width: 1.0),
                ),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Comensals:",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Color(0xFF277A46))),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_comensalsFocusNode);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: const Color(0xFF817570),
                    width: 1,
                  ),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Row(
                  children: [
                    IconButton(
                      icon: const Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (reservation.numberComensals > 1) {
                            reservation.numberComensals--;
                            _comensalsController.text =
                                reservation.numberComensals.toString();
                          }
                        });
                      },
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _comensalsFocusNode,
                        controller: _comensalsController,
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18),
                        decoration:
                            const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          reservation.numberComensals++;
                          _comensalsController.text =
                              reservation.numberComensals.toString();
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: _bookReservation,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF277A46),
                  foregroundColor: Colors.white,
                ),
                child: const Text("Book"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
