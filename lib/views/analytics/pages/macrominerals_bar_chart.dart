import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../widget/calander_dialoge.dart';
import '../widget/calander_selection_widget.dart';

class MacromineralsBarChart extends StatefulWidget {
  const MacromineralsBarChart({super.key});

  @override
  State<MacromineralsBarChart> createState() => _MacromineralsBarChartState();
}

class _MacromineralsBarChartState extends State<MacromineralsBarChart> {
  DateTime _selectedDate = DateTime.now(); // The selected date

  // Show the calendar in a dialog when clicked
  void _showCalendarDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return CalendarDialogForAnalytics(
          selectedDate: _selectedDate,
          onDateSelected: (selectedDay) {
            setState(() {
              _selectedDate = selectedDay; // Update the selected date
            });
          },
        );
      },
    );
  }

  // Format the selected date to display in "DD Month" format
  String _formatDate(DateTime date) {
    return "${date.day} ${_getMonthName(date.month)}"; // Format the date as "18 July"
  }

  // Helper method to get month name from month number
  String _getMonthName(int month) {
    const months = [
      'January', 'February', 'March', 'April', 'May', 'June',
      'July', 'August', 'September', 'October', 'November', 'December'
    ];
    return months[month - 1];
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(10.w),
        child: SizedBox(
          height: 0.45.sh,
          child: Card(
            color: Colors.white,
            elevation: .1,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CalendarSelector(
                  title: "Macrominerals",
                  date: _formatDate(_selectedDate),
                  onCalendarTap: _showCalendarDialog, // Pass the calendar dialog callback
                ),
                Text(
                  "Daily intake (mg)",
                  style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300,color: Color(0xff6D6D6D)),
                ),
                SizedBox(height: 20.h),

                // Bar chart drawn using CustomPainter
                CustomPaint(
                  size: Size(300.w, 250.h,), // Chart size
                  painter: BarChartPainter(),
                ),
              ],
            ),
          ),
        ),
      );
  }
}

class BarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // Define the colors for the bars (using light green color)
    Color barColor = Color(0xffBDE87C); // #BDE87C color

    // Bar data (macrominerals: P, Mg, Na, K, Ca, Cl, S)
    List<Map<String, dynamic>> data = [
      {"name": "P", "value": 61.45}, // Phosphorus
      {"name": "Mg", "value": 50.19}, // Magnesium
      {"name": "Na", "value": 38.45}, // Sodium
      {"name": "K", "value": 31.78},  // Potassium
      {"name": "Ca", "value": 44.32}, // Calcium
      {"name": "Cl", "value": 63.6},  // Chlorine
      {"name": "S", "value": 63.6},   // Sulfur
    ];

    // Maximum Y-axis value (set based on data)
    double maxY = 100.0;

    // Calculate the width of each bar and spacing dynamically based on screen size
    double barWidth = size.width / (data.length * 1.85); // Adjust width dynamically
    double spaceBetweenBars = barWidth;

    // Y-axis scaling factor (based on the maximum Y value)
    double scaleY = size.height / maxY;

    // Draw bars
    for (int i = 0; i < data.length; i++) {
      double barHeight = data[i]["value"] * scaleY;
      double xPos = (i * 2) * barWidth; // Calculate X position for each bar
      double yPos = size.height - barHeight; // Y position (flip it to start from bottom)

      // Draw the bar with rounded top corners
      paint.color = barColor;
      RRect bar = RRect.fromRectAndCorners(
        Rect.fromLTWH(xPos, yPos, barWidth, barHeight),
        topLeft: Radius.circular(10.r),topRight: Radius.circular(10.r), // Rounded top corners
      );
      canvas.drawRRect(bar, paint);

      // Draw the value (intake) above the bar
      TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );
      TextStyle textStyle = TextStyle(fontSize: 12.sp, color: Colors.black);
      textPainter.text = TextSpan(
        text: data[i]["value"].toStringAsFixed(1), // Show the value with 2 decimal places
        style: textStyle,
      );
      textPainter.layout();
      // Position the text above the bar
      textPainter.paint(
        canvas,
        Offset(xPos + (barWidth / 2) - (textPainter.width / 2), yPos - 20.h),
      );
    }

    // Draw X-axis labels (macrominerals)
    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    TextStyle textStyle = TextStyle(fontSize: 12.sp, color: Colors.black);
    for (int i = 0; i < data.length; i++) {
      textPainter.text = TextSpan(
        text: data[i]["name"],
        style: textStyle,
      );
      textPainter.layout();
      // Position the name below each bar
      textPainter.paint(
        canvas,
        Offset((i * 2 + .4) * barWidth - textPainter.width/5 , size.height + 5.h),
      );
    }

    // Draw Y-axis grid lines and labels
    paint.color = Colors.black12;
    paint.strokeWidth = 0.3;
    for (int i = 0; i <= 5; i++) {
      double yPosition = size.height - (i * (size.height / 5));
      canvas.drawLine(
        Offset(0, yPosition),
        Offset(size.width, yPosition),
        paint,
      );

      // Y-axis labels
      textPainter.text = TextSpan(
        text: (maxY / 5 * i).toStringAsFixed(0),
        style: textStyle,
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(-30.w, yPosition - 10.h));
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless data changes
  }
}