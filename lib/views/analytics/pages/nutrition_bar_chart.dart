import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NutritionChart extends StatelessWidget {
  final List<List<double>> data = [
    [50, 30, 20], // Day 15 (100%)
    [45, 35, 20], // Day 16 (100%)
    [55, 25, 20], // Day 17 (100%)
    [60, 20, 20], // Day 18 (100%)
    [40, 30, 20], // Day 19 (100%)
    [40, 10, 20], // Day 20 (30%)
  ];

  final List<String> xLabels = ["15", "16", "17", "18", "19", "20"];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: SizedBox(
        height: 380.h,
        child: Card(
          color: Colors.white,
          elevation: .1,
          child: Padding(
            padding: const EdgeInsets.all(18),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Text(
                      "Macronutrients",
                      style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Weekly Intake",
                      style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
                SizedBox(
                    width: .85.sw,
                    child: Divider(color: Color(0xffE0E0E0),)),
                _buildTitleAndLegend(),
                SizedBox(height: 5.h),
                _buildChartWithYAxis(),
                _buildXAxisLabels(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  /// **🔻 Title & Legend (Carbs, Protein, Fat)**
  Widget _buildTitleAndLegend() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            _buildLegendItem(Colors.redAccent, "Carbs"),
            SizedBox(width: 8.w),
            _buildLegendItem(Colors.orangeAccent, "Protein"),
            SizedBox(width: 8.w),
            _buildLegendItem(Colors.lightBlueAccent, "Fat"),
          ],
        ),
        SizedBox(height: 20.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Spacer(flex: 1),
            Text("Nutrition Goal", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400,color: Color(0xff6D6D6D))),
            Text(" ------", style: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.bold,color: Colors.green)),
            Spacer(flex: 4,),
          ],
        ),

      ],
    );
  }

  Widget _buildLegendItem(Color color, String text) {
    return Row(
      children: [
        Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(15),color: color),
            width: 8.w, height: 8.w, ),
        SizedBox(width: 4.w),
        Text(text, style: TextStyle(fontSize: 12.sp, color: Colors.grey.shade700)),
      ],
    );
  }

  /// **🔻 X-Axis Labels (Perfectly Centered)**
  Widget _buildXAxisLabels() {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround, // ✅ Even spacing for labels
        children: xLabels
            .map((day) => Text(day, style: TextStyle(fontSize: 12.sp, color: Colors.grey)))
            .toList(),
      ),
    );
  }

  /// **🔻 Y-Axis with Chart (Properly Scaled Bars)**
  Widget _buildChartWithYAxis() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end, // ✅ Align bars at the bottom
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [100, 75, 50, 25, 0].map((label) {
            return Padding(
              padding: EdgeInsets.symmetric(vertical: 13.5.h),
              child: Row(
                children: [
                  Text(label.toString(), style: TextStyle(fontSize: 12.sp, color: Colors.grey)),
                ],
              ),
            );
          }).toList(),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: SizedBox(
            height: 200.h,
            child: CustomPaint(
              painter: NutritionChartPainter(data),
              child: Container(),
            ),
          ),
        ),
      ],
    );
  }
}

/// **🎨 Custom Chart Painter**
class NutritionChartPainter extends CustomPainter {
  final List<List<double>> data;
  NutritionChartPainter(this.data);

  final List<Color> colors = [
    Color(0xffFF938B),   // Carbs (bottom rounded)
    Color(0xffFFAE4C),   // Protein (middle, straight)
    Color(0xff6ADEF5),  // Fat (top rounded)
  ];

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;
    double barWidth = size.width / (data.length * 2); // ✅ Adjusted bar width for proper spacing
    double space = barWidth;

    // **🔻 Draw Nutrition Goal Dashed Line**
    Paint dashPaint = Paint()
      ..color = Colors.green
      ..strokeWidth = 1.5
      ..style = PaintingStyle.stroke;

    double dashWidth = 5;
    double dashSpace = 3;
    double startY = 0;
    double startX = 0;
    while (startX < size.width) {
      canvas.drawLine(Offset(startX, startY), Offset(startX + dashWidth, startY), dashPaint);
      startX += dashWidth + dashSpace;
    }

    // **🔻 Draw Bars - Correctly Scaled to Actual Value**
    double maxYValue = 100; // ✅ Always set max value as 100 for correct scaling

    for (int i = 0; i < data.length; i++) {
      double x = i * (barWidth + space) + space / 2;
      double y = size.height - 20; // ✅ Ensure bars start exactly at the bottom (0%)

      double totalValue = data[i].reduce((a, b) => a + b); // ✅ Actual total of the bar
      double totalHeight = (totalValue / maxYValue) * (size.height - 18); // ✅ Scale relative to 100%

      for (int j = 0; j < data[i].length; j++) {
        double barHeight = (data[i][j] / totalValue) * totalHeight; // ✅ Ensure proportional segments
        paint.color = colors[j];

        // **Rounded Corners Logic**
        RRect rRect = RRect.fromRectAndCorners(
          Rect.fromLTWH(x, y - barHeight, barWidth, barHeight),
          topLeft: j == 2 ? Radius.circular(15.r) : Radius.zero, // Top corners for Fat (index 2)
          topRight: j == 2 ? Radius.circular(15.r) : Radius.zero,
          bottomLeft: j == 0 ? Radius.circular(15.r) : Radius.zero, // Bottom corners for Carbs (index 0)
          bottomRight: j == 0 ? Radius.circular(15.r) : Radius.zero,
        );

        canvas.drawRRect(rRect, paint);
        y -= barHeight; // ✅ Ensure bars are stacked properly
      }
    }
  }

  @override
  bool shouldRepaint(NutritionChartPainter oldDelegate) {
    return true;
  }
}
