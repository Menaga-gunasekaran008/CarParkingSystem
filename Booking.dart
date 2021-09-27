import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
 
void main() => runApp(AutoFitCalendar());
 
class AutoFitCalendar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
                child: SfCalendar(
          view: CalendarView.day,
          allowedViews: <CalendarView>[
            CalendarView.day,
            CalendarView.week,
            CalendarView.workWeek
          ],
          timeSlotViewSettings: TimeSlotViewSettings(timeIntervalHeight: -1),
        ))));
  }
}