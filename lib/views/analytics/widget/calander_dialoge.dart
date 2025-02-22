import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart'; // Import TableCalendar

class CalendarDialogForAnalytics extends StatelessWidget {
  final DateTime selectedDate;
  final ValueChanged<DateTime> onDateSelected;

  const CalendarDialogForAnalytics({
    super.key,
    required this.selectedDate,
    required this.onDateSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: SizedBox(
        height: 0.1.sh, // Set the desired height for the dialog.0, // Set height to ensure it fits well
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: TableCalendar(
            firstDay: DateTime.utc(2020, 10, 16),
            lastDay: DateTime.utc(2030, 3, 14),
            focusedDay: selectedDate,
            selectedDayPredicate: (day) {
              return isSameDay(selectedDate, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              onDateSelected(selectedDay); // Pass selected date back
              Navigator.pop(context); // Close the dialog
            },
            headerVisible: false,
            calendarFormat: CalendarFormat.week,
            availableGestures: AvailableGestures.horizontalSwipe,
            headerStyle: HeaderStyle(
              formatButtonVisible: false,
              titleCentered: true,
              leftChevronVisible: false,
              rightChevronVisible: false,
            ),
            daysOfWeekStyle: DaysOfWeekStyle(
              weekdayStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
              weekendStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.w400),
            ),
            calendarStyle: CalendarStyle(
              selectedDecoration: BoxDecoration(
                color: Colors.black,
                shape: BoxShape.circle,
              ),
              todayDecoration: BoxDecoration(
                color: Colors.transparent,
                shape: BoxShape.circle,
              ),
              todayTextStyle: TextStyle(color: Colors.black),
              outsideTextStyle: TextStyle(color: Colors.grey),
              selectedTextStyle: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
