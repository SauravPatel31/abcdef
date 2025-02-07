import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(MaterialApp(
    home: CustomCalendarUI(),
  ));
}

class CustomCalendarUI extends StatefulWidget {
  @override
  _CustomCalendarUIState createState() => _CustomCalendarUIState();
}

class _CustomCalendarUIState extends State<CustomCalendarUI> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  void _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _focusedDay,
      firstDate: DateTime(2020, 1, 1),
      lastDate: DateTime(2030, 12, 31),
    );
    if (picked != null) {
      setState(() {
        _focusedDay = picked;
        _selectedDay = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: GestureDetector(
          onTap: _pickDate,
          child: Column(
            children: [
              Text(
                DateFormat('MMMM').format(_focusedDay),
                style: TextStyle(color: Colors.purple, fontWeight: FontWeight.bold, fontSize: 18),
              ),
              Text(
                DateFormat('y').format(_focusedDay),
                style: TextStyle(color: Colors.grey, fontSize: 14),
              ),
            ],
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.chevron_left, color: Colors.purple),
          onPressed: () {
            setState(() {
              _focusedDay = DateTime(_focusedDay.year, _focusedDay.month - 1);
            });
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.chevron_right, color: Colors.purple),
            onPressed: () {
              setState(() {
                _focusedDay = DateTime(_focusedDay.year, _focusedDay.month + 1);
              });
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Calendar Widget
          TableCalendar(
            firstDay: DateTime.utc(2020, 1, 1),
            lastDay: DateTime.utc(2030, 12, 31),
            focusedDay: _focusedDay,
            selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.purple,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.purple.shade300,
                shape: BoxShape.circle,
              ),
              defaultTextStyle: TextStyle(color: Colors.black),
              weekendTextStyle: TextStyle(color: Colors.red),
            ),
            headerVisible: false,
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.grey),
              weekendStyle: TextStyle(color: Colors.grey),
            ),
          ),
          Divider(),
          // Appointments Header
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Your appointments",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Text(
                  _selectedDay != null
                      ? DateFormat('d-MM-y').format(_selectedDay!)
                      : DateFormat('d-MM-y').format(_focusedDay),
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          // Appointments List
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 16),
              children: [
                AppointmentCard(
                  time: "10:00-13:00",
                  title: "Need to get a tux amde",
                  subtitle: "Start from screen 16",
                  color: Colors.green,
                ),
                AppointmentCard(
                  time: "14:00-15:00",
                  title: "Custom shirt",
                  subtitle:
                  "Define the problem or question that... View more",
                  color: Colors.purple,
                ),
                AppointmentCard(
                  time: "19:00-20:00",
                  title: "description",
                  subtitle:
                  "xxyyyxjhvjdbjdgyjdbbkekhagebdjhqbd",
                  color: Colors.orange,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class AppointmentCard extends StatelessWidget {
  final String time;
  final String title;
  final String subtitle;
  final Color color;

  const AppointmentCard({
    required this.time,
    required this.title,
    required this.subtitle,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        side: BorderSide(color: color, width: 1),
        borderRadius: BorderRadius.circular(12),
      ),
      margin: EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: [
            Container(
              width: 8,
              height: 8,
              margin: EdgeInsets.only(right: 8),
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: color,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    time,
                    style: TextStyle(color: Colors.grey),
                  ),
                  SizedBox(height: 4),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 4),
                  Text(
                    subtitle,
                    style: TextStyle(color: Colors.grey),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            Icon(Icons.more_vert, color: Colors.grey),
          ],
        ),
      ),
    );
  }
}
