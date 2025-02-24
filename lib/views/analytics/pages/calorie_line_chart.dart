import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

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
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, left: 15, right: 15, bottom: 10),
                child: Row(
                  children: [
                    Text(
                      "Calorie (Kcal)",
                      style: TextStyle(
                          fontSize: 14.sp, fontWeight: FontWeight.bold),
                    ),
                    Spacer(),
                    Text(
                      "Weekly Intake",
                      style: TextStyle(
                          fontSize: 12.sp, fontWeight: FontWeight.w300),
                    ),
                  ],
                ),
              ),
              SizedBox(
                  width: .85.sw,
                  child: Divider(
                    color: Color(0xffE0E0E0),
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Yesterday",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '•', // Bullet point symbol
                    style: TextStyle(fontSize: 30.sp, color: Color(0xffA1CE50)),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    "Calorie Goal",
                    style:
                        TextStyle(fontSize: 12.sp, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: const EdgeInsets.only(left: 40),
                child: CustomPaint(
                  size: Size(
                    310.w,
                    230.h,
                  ), // Chart size
                  painter: CustomChartPainter(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomChartPainter extends CustomPainter {
  final List<double> dataPoints = [2500, 2400, 2500, 3000, 2550, 2500];
  final List<String> xLabels = ['15', '16', '17', '18', '19', '20'];
  final List<String> yLabels = ['500', '1000', '1500', '2000', '2500', '3000'];

  @override
  void paint(Canvas canvas, Size size) {
    Paint gridPaint = Paint()
      ..color = Colors.black12
      ..strokeWidth = 0.5;

    Paint linePaint = Paint()
      ..color = Color(0xffA1CE50)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 4;

    Paint fillPaint = Paint()
      ..shader = LinearGradient(
        colors: [
          Color(0xFFCEE4B1).withOpacity(0.8),
          Color(0xFFCEE4B1).withOpacity(0.1),
        ],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
      ).createShader(Rect.fromLTRB(0, 0, size.width, size.height))
      ..style = PaintingStyle.fill;

    Paint dotPaint = Paint()
      ..color = Color(0xffA1CE50)
      ..style = PaintingStyle.fill;

    Paint borderPaint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2
      ..style = PaintingStyle.fill;
    double minY = 500;
    double maxY = 3000;

    double xSpacing = size.width / (dataPoints.length - 1);
    double yScaling = size.height / (maxY - minY);

    Path path = Path();
    Path fillPath = Path();
    List<Offset> points = [];

    for (int i = 0; i < dataPoints.length; i++) {
      double x = i * xSpacing;
      double y = size.height - (dataPoints[i] - minY) * yScaling;
      points.add(Offset(x, y));
    }

    path.moveTo(points.first.dx, points.first.dy);
    fillPath.moveTo(points.first.dx, points.first.dy);

    for (int i = 0; i < points.length - 1; i++) {
      double x1 = points[i].dx;
      double y1 = points[i].dy;
      double x2 = points[i + 1].dx;
      double y2 = points[i + 1].dy;

      double controlX1 = (x1 + x2) / 2;
      double controlY1 = y1;
      double controlX2 = (x1 + x2) / 2;
      double controlY2 = y2;

      path.cubicTo(controlX1, controlY1, controlX2, controlY2, x2, y2);
      fillPath.cubicTo(controlX1, controlY1, controlX2, controlY2, x2, y2);
    }

    fillPath.lineTo(points.last.dx, size.height);
    fillPath.lineTo(points.first.dx, size.height);
    fillPath.close();

    canvas.drawPath(fillPath, fillPaint);
    canvas.drawPath(path, linePaint);

    for (var point in points) {
      canvas.drawCircle(point, 6, dotPaint);
      canvas.drawCircle(point, 4, borderPaint);
    }

    TextPainter textPainter = TextPainter(
      textDirection: TextDirection.ltr,
    );

    for (int i = 0; i < xLabels.length; i++) {
      textPainter.text = TextSpan(
        text: xLabels[i],
        style: TextStyle(fontSize: 12, color: Colors.black),
      );
      textPainter.layout();
      textPainter.paint(canvas,
          Offset(i * xSpacing - textPainter.width / 2, size.height + 4));
    }

    for (int i = 0; i < yLabels.length; i++) {
      double yPos = size.height - (i * (size.height / (yLabels.length - 1)));
      textPainter.text = TextSpan(
        text: yLabels[i],
        style: TextStyle(fontSize: 12, color: Colors.black),
      );
      textPainter.layout();
      textPainter.paint(canvas, Offset(-40, yPos - textPainter.height / 2));
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => true;
}
