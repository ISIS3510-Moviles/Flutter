import 'package:campus_bites/domain/entities/pending_state.dart';
import 'package:campus_bites/domain/entities/reservation_entity.dart';
import 'package:campus_bites/domain/entities/restaurant_entity.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookTab extends StatefulWidget {
  final RestaurantEntity restaurant;
  const BookTab(
    this.restaurant, {
    super.key,
  });

  @override
  BookTabState createState() => BookTabState();
}

class BookTabState extends State<BookTab> {
  late ReservationEntity reservation;
  final FocusNode _comensalsFocusNode = FocusNode();
  Color _borderColor = const Color(0xFF817570);
  late TextEditingController _dateController;
  late TextEditingController _comensalsController;

  @override
  void initState() {
    super.initState();
    reservation = ReservationEntity(
      id: "1",
      date: DateFormat('MM/dd/yyyy').format(DateTime.now()),
      time: "12:00",
      numberComensals: 1,
      state: PendingState(),
    );
    _dateController = TextEditingController(text: reservation.date);
    _comensalsController = TextEditingController(text: reservation.numberComensals.toString());

    _comensalsFocusNode.addListener(() {
      setState(() {
        _borderColor = _comensalsFocusNode.hasFocus ? Colors.black : const Color(0xFF817570);
      });
    });
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
      setState(() {
        reservation.date = DateFormat('MM/dd/yyyy').format(picked);
        _dateController.text = reservation.date;
      });
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
            const Text("Date:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF277A46))),
            TextField(
              controller: _dateController,
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: const Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: const OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 16),
            const Text("Hour", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            DropdownButtonFormField<String>(
              value: reservation.time,
              items: ["12:00", "13:00", "14:00", "15:00", "16:00"].map((hour) {
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
              ),
            ),
            const SizedBox(height: 16),
            const Text("Comensals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF277A46))),
            GestureDetector(
              onTap: () {
                FocusScope.of(context).requestFocus(_comensalsFocusNode);
              },
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(color: _borderColor, width: 1),
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
                            _comensalsController.text = reservation.numberComensals.toString();
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
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        decoration: const InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: const Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          reservation.numberComensals++;
                          _comensalsController.text = reservation.numberComensals.toString();
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
                onPressed: () {},
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