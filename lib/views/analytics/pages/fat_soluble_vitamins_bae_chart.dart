import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../widget/calander_dialoge.dart';
import '../widget/calander_selection_widget.dart';

class VitaminConsumptionChart extends StatefulWidget {
  const VitaminConsumptionChart({super.key});

  @override
  State<VitaminConsumptionChart> createState() => _VitaminConsumptionChartState();
}

class _VitaminConsumptionChartState extends State<VitaminConsumptionChart> {
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
        height: 0.5.sh,
        child: Card(
          color: Colors.white,
          elevation: .1,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              CalendarSelector(
                title: "Fat soluble vitamins",
                date: _formatDate(_selectedDate),
                onCalendarTap: _showCalendarDialog, // Pass the calendar dialog callback
              ),
              SizedBox(height: .010.sh,),
              Row(
                children: [
                  SizedBox(width: .13.sw,),
                  Text("mg/mcg"),
                  SizedBox(width: 10.w,),
                  SvgPicture.asset('assets/svg/arrow.svg'),
                ],
              ),
              SizedBox(height: .04.sh,),
              // Bar chart drawn using CustomPainter
              CustomPaint(
                size: Size(0.65.sw, 0.25.sh,), // Chart size
                painter: VitaminBarChartPainter(),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(flex: 1,),
                  Text("Consumption", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400)),
                  Spacer(flex: 1,),
                  Container(
                    width: 5.w,height: 5.h,
                    color: Color(0xff80E6EA),
                  ),
                  SizedBox(width: 5,),
                  Text("(mg)", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400)),
                  Spacer(flex: 1,),
                  Container(
                    width: 5.w,height: 5.h,
                    color: Color(0xffFFD799),
                  ),
                  SizedBox(width: 5,),
                  Text("(mcg)", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400)),
                  Spacer(flex: 1,),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Painter to draw the horizontal bar chart
class VitaminBarChartPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    // Bar data (vitamins and their consumption)
    List<Map<String, dynamic>> data = [
      {"name": "Vit- A", "value": 1184.68, "unit": "mcg"}, // mcg
      {"name": "Vit- D2", "value": 2275.21, "unit": "mcg"},
      {"name": "Vit- D3", "value": 2428.41, "unit": "mcg"},
      {"name": "Vit- E", "value": 1237.04, "unit": "mg"}, // mg
      {"name": "Vit- K1", "value": 1484.68, "unit": "mcg"},
      {"name": "Vit- K2", "value": 1184.68, "unit": "mg"},
    ];

    // Maximum value for scaling the bars (3000 in this case)
    double maxX = 3000.0;

    // Calculate the height of each bar and spacing dynamically based on screen size
    double barHeight = size.height / (data.length * 1.85); // Adjust height dynamically
    double spaceBetweenBars = barHeight;

    // X-axis scaling factor (based on the maximum X value)
    double scaleX = size.width / maxX;

    // Colors for the bars: Orange for mcg and Cyan for mg
    Color mcgColor = Color(0xFFFFD799); // #FFD799 (Orange)
    Color mgColor = Color(0xFF80E6EA); // #80E6EA (Cyan)

    // Draw bars
    for (int i = 0; i < data.length; i++) {
      double barWidth = data[i]["value"] * scaleX; // Calculate bar width based on value

      // Determine the color of the bar based on the unit (mcg or mg)
      paint.color = data[i]["unit"] == "mcg" ? mcgColor : mgColor;

      // Draw the bar (horizontal)
      double yPos = i * (barHeight * 2); // Calculate Y position for each bar
      RRect bar = RRect.fromRectAndCorners(
        Rect.fromLTWH(0, yPos, barWidth, barHeight),
        bottomRight: Radius.circular(10.r),topRight: Radius.circular(10.r), // Rounded top corners
      );
      canvas.drawRRect(bar, paint);

      // Draw the label (vitamin name) at the start of the bar (vertically)
      TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );
      TextStyle textStyle = TextStyle(fontSize: 12.sp, color: Colors.black);
      textPainter.text = TextSpan(
        text: data[i]["name"],
        style: textStyle,
      );
      textPainter.layout();
      // Position the label at the start of the bar (left side)
      canvas.save();
      canvas.translate(0.w, yPos + (barHeight / 2)); // Position label at the start of the bar
      canvas.rotate(-50.27); // Rotate the text 90 degrees counter-clockwise
      textPainter.paint(
        canvas,
        Offset(-40, -8),
      );
      canvas.restore();

      // Draw the value (consumption) next to the bar (right side, horizontally)
      TextSpan valueText = TextSpan(
        text: data[i]["value"].toString(),
        style: TextStyle(fontSize: 12.sp, color: Colors.black),
      );
      textPainter.text = valueText;
      textPainter.layout();
      textPainter.paint(
        canvas,
        Offset(barWidth + 10.w, yPos + (barHeight / 2) - (textPainter.height / 2)),
      );
    }

   /* // Draw X-axis line (horizontal) at the bottom
    paint.color = Colors.black;
    paint.strokeWidth = 2;
    canvas.drawLine(
      Offset(0, size.height),
      Offset(size.width, size.height),
      paint,
    );*/

    // Draw X-axis labels (macrominerals) below the X-axis line
/*    TextPainter textPainterX = TextPainter(
      textDirection: TextDirection.ltr,
    );
    TextStyle textStyleX = TextStyle(fontSize: 12.sp, color: Colors.black);
    for (int i = 0; i < data.length; i++) {
      textPainterX.text = TextSpan(
        text: data[i]["name"],
        style: textStyleX,
      );
      textPainterX.layout();
      // Position the name below each bar (X-axis)
      textPainterX.paint(
        canvas,
        Offset((i * 2 + 1) * barHeight - textPainterX.width / 2, size.height + 5.h), // Position label below the bar
      );
    }*/

// Draw Y-axis grid lines and labels
// Draw X-axis grid lines and labels
    paint.color = Colors.black12;
    paint.strokeWidth = 0.3;

    for (int i = 0; i <= 5; i++) {
      double xPosition = i * (size.width / 5);

      // Draw vertical grid lines
      canvas.drawLine(
        Offset(xPosition, 0),
        Offset(xPosition, size.height),
        paint,
      );

      // X-axis labels (positioned at the top)
      TextPainter textPainter = TextPainter(
        textDirection: TextDirection.ltr,
      );
      TextStyle textStyle = TextStyle(fontSize: 12.sp, color: Colors.black);
      textPainter.text = TextSpan(
        text: (maxX / 5 * i).toStringAsFixed(0), // Adjust the label value as needed
        style: textStyle,
      );
      textPainter.layout();

      // Adjust label position to be above the top edge
      textPainter.paint(canvas, Offset(xPosition - textPainter.width / 2, -20.h));
    }

  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false; // No need to repaint unless data changes
  }
}
