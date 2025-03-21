import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BookTab extends StatefulWidget {
  const BookTab({super.key});

  @override
  BookTabState createState() => BookTabState();
}

class BookTabState extends State<BookTab> {
  DateTime selectedDate = DateTime.now();
  String? selectedHour;
  int comensals = 1;
  final FocusNode _comensalsFocusNode = FocusNode();
  Color _borderColor = Color(0xFF817570);

  @override
  void initState() {
    super.initState();
    _comensalsFocusNode.addListener(() {
      setState(() {
        _borderColor = _comensalsFocusNode.hasFocus ? Colors.black : Color(0xFF817570);
      });
    });
  }

  @override
  void dispose() {
    _comensalsFocusNode.dispose();
    super.dispose();
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }

  }


  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      margin: EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Date:", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF277A46))),
            TextField(
              controller: TextEditingController(text: DateFormat('MM/dd/yyyy').format(selectedDate)),
              readOnly: true,
              decoration: InputDecoration(
                suffixIcon: IconButton(
                  icon: Icon(Icons.calendar_today),
                  onPressed: () => _selectDate(context),
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text("Hour", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
            DropdownButtonFormField<String>(
              value: selectedHour,
              items: ["12:00", "13:00", "14:00", "15:00", "16:00"].map((hour) {
                return DropdownMenuItem(
                  value: hour,
                  child: Text(hour),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedHour = value;
                });
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),
            Text("Comensals", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Color(0xFF277A46))),
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
                      icon: Icon(Icons.remove),
                      onPressed: () {
                        setState(() {
                          if (comensals > 1) comensals--;
                        });
                      },
                    ),
                    Expanded(
                      child: TextField(
                        focusNode: _comensalsFocusNode,
                        controller: TextEditingController(text: comensals.toString()),
                        readOnly: true,
                        textAlign: TextAlign.center,
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
                        decoration: InputDecoration(border: InputBorder.none),
                      ),
                    ),
                    IconButton(
                      icon: Icon(Icons.add),
                      onPressed: () {
                        setState(() {
                          comensals++;
                        });
                      },
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            Center(
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFF277A46),
                  foregroundColor: Colors.white,
                ),
                child: Text("Book"),
              ),
            )
          ],
        ),
      ),
    );
  }
}