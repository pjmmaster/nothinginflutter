import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:ptaskcheck/phelper.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

class TabCalendar extends StatefulWidget {
  @override
  _TabCalendarState createState() => _TabCalendarState();
}

class _TabCalendarState extends State<TabCalendar> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            TableCalendar(
              firstDay: DateTime.utc(2021, 5, 1),
              lastDay: DateTime.utc(2021, 8, 1),
              focusedDay: DateTime.now(),
              calendarBuilders: CalendarBuilders(
                dowBuilder: (context, day) {
                  if (day.weekday == DateTime.sunday) {
                    final text = DateFormat.E().format(day);

                    return Center(
                      child: Text(
                        text,
                        style: TextStyle(color: Colors.red),
                      ),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
