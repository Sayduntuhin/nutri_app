import 'dart:math';

import 'package:flutter/material.dart';

class VerticalScrollPicker extends StatefulWidget {
  final double bottomValue;
  final double topValue;
  final double interval;
  final Color? backgroundItemColor;
  final Color? foregroundItemColor;
  final String Unit;
  final ValueChanged<double>? onChanged;

  const VerticalScrollPicker({
    super.key,
    required this.bottomValue,
    required this.topValue,
    required this.interval,
    this.backgroundItemColor,
    this.foregroundItemColor,
    this.onChanged,
    required this.Unit,
  });

  @override
  State<VerticalScrollPicker> createState() => _VerticalScrollPickerState();
}

class _VerticalScrollPickerState extends State<VerticalScrollPicker> {
  double pickedValue = 0;
  double scrollOffset = 0;
  double itemHeight = 16.0;
  @override
  void initState() {
    super.initState();
    // pickedValue = (widget.startValue + widget.endValue) / 2;
  }

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minHeight: 300,
        minWidth: 260,
      ),
      child: GestureDetector(
        onVerticalDragUpdate: _onDragVertically,
        child: ClipRect(
          child: CustomPaint(
            painter: ScalePainter(
              color: widget.backgroundItemColor,
              itemHeight: itemHeight,
              onMidValueChanged: (_pickedValue) {

                WidgetsBinding.instance.addPostFrameCallback((__) {
                  if (_pickedValue != pickedValue) {
                    widget.onChanged?.call(_pickedValue);
                    setState(() {
                      pickedValue = _pickedValue;
                    });
                  }
                });
              },
              startValue: widget.bottomValue,
              endValue: widget.topValue,
              interval: widget.interval,
              scrollOffset: scrollOffset,
              offsetLeft: 18,
            ),
            foregroundPainter: MarkPainter(
              color: widget.foregroundItemColor,
              pickedValue: pickedValue,
              offsetLeft: 18,
              Unit: widget.Unit,

            ),
          ),
        ),
      ),
    );
  }

  void _onDragVertically(DragUpdateDetails details) {
    print(details.delta.dy);
    double tempScrollOffset = scrollOffset + details.primaryDelta!;
    if ((details.delta.dy) < 0 && pickedValue <= widget.bottomValue) {
      return;
    }
    if ((details.delta.dy) > 0 && pickedValue >= widget.topValue) {
      return;
    }
    setState(() {
      scrollOffset = tempScrollOffset;
    });
  }
}

class ScalePainter extends CustomPainter {
  final Color? color;
  final double startValue;
  final double endValue;
  final double interval;
  final double scrollOffset;
  final double offsetLeft;
  final double itemHeight;
  final Function(double pickedValue) onMidValueChanged; // Callback

  ScalePainter({
    required this.startValue,
    required this.endValue,
    required this.interval,
    required this.scrollOffset,
    required this.onMidValueChanged, // Pass callback
    this.color,
    this.offsetLeft = 12,
    this.itemHeight = 16.0,
  });

  @override
  void paint(Canvas canvas, Size size) {
    var offsetLeftFinal = offsetLeft + 6;
    final finalColor = color ?? Color(0xFFBDBDBD);
    final Paint minorScalePaint = Paint()
      ..color = finalColor
      ..strokeWidth = 2;

    // Calculate total range and number of divisions
    double totalRange = (endValue - startValue).abs();
    int totalLines = (totalRange ~/ interval) * 10; // 10 divisions per interval

    int extraLines = 20; // Extra lines above and below the range


    double halfHeight = size.height / 2;

    // **Find midpoint value (center of screen)**
    double pickedValue =
        endValue - ((halfHeight - scrollOffset) / itemHeight * (interval / 10));

    // **Start from `endValue` at the top and move downwards**
    for (int i = -extraLines; i <= totalLines + extraLines; i++) {
      double y = (i * itemHeight) + scrollOffset; // Apply scroll offset
      double value =
          endValue - (i * interval / 10); // Calculate value at this position

      var scaleAmount = 2;

      // **Draw major labels every interval**
      if (i % 10 == 0) {
        // Check if text position is near the center
        bool isMid = (y - size.height / 2).abs() < itemHeight;

        // Ensure text is only drawn within the actual value range
        bool isWithinRange = value >= startValue && value <= endValue;

        if (!isMid &&
            isWithinRange &&
            pickedValue.floor().toString() != value.toStringAsFixed(0)) {
          _drawText(canvas, value.toStringAsFixed(0),
              Offset(offsetLeftFinal * scaleAmount + 30, y - 7));
        }

        scaleAmount = 3;
      }

      // **Draw horizontal scale lines**
      canvas.drawLine(
        Offset(offsetLeftFinal, y),
        Offset(offsetLeftFinal * scaleAmount, y),
        minorScalePaint,
      );

      // **Draw small lines between intervals**
      canvas.drawLine(
        Offset(offsetLeftFinal, y),
        Offset(offsetLeftFinal, y - itemHeight),
        minorScalePaint,
      );
    }

    // **Pass picked value via callback**
    onMidValueChanged(max(pickedValue,0));
  }

  /// Draws a value label at the given position
  void _drawText(Canvas canvas, String text, Offset position) {
    final TextSpan textSpan = TextSpan(
      text: text,
      style: TextStyle(
        color: Colors.grey.shade700,
        fontSize: 12,
        fontWeight: FontWeight.bold,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );

    textPainter.layout();
    textPainter.paint(canvas, position);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}

class MarkPainter extends CustomPainter {
  final double pickedValue;
  final double offsetLeft;
  final Color? color;
  final String Unit;

  MarkPainter({
    required this.pickedValue,
    this.offsetLeft = 12,
    this.color,
    required this.Unit
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint arrowPaint = Paint()
      ..color = color ?? Colors.black
      ..strokeWidth = 3
      ..style = PaintingStyle.fill;

    double arrowHandle = 80;
    double arrowHeadSize = 6;
    double gap = 50;

    Offset center = Offset(size.width / 2, size.height / 2);

    // **UP Arrow (↑)**
    Offset upStart = Offset(6, center.dy - gap / 2);
    Offset upEnd = Offset(6, upStart.dy - arrowHandle);
    canvas.drawLine(upStart, upEnd, arrowPaint);

    Path upArrowHead = Path();
    upArrowHead.moveTo(upEnd.dx, upEnd.dy - 2);
    upArrowHead.lineTo(upEnd.dx - arrowHeadSize, upEnd.dy + arrowHeadSize);
    upArrowHead.lineTo(upEnd.dx + arrowHeadSize, upEnd.dy + arrowHeadSize);
    upArrowHead.close();
    canvas.drawPath(upArrowHead, arrowPaint);

    // **DOWN Arrow (↓)**
    Offset downStart = Offset(6, center.dy + gap / 2);
    Offset downEnd = Offset(6, downStart.dy + arrowHandle);
    canvas.drawLine(downStart, downEnd, arrowPaint);

    Path downArrowHead = Path();
    downArrowHead.moveTo(downEnd.dx, downEnd.dy + 2);
    downArrowHead.lineTo(
        downEnd.dx - arrowHeadSize, downEnd.dy - arrowHeadSize);
    downArrowHead.lineTo(
        downEnd.dx + arrowHeadSize, downEnd.dy - arrowHeadSize);
    downArrowHead.close();
    canvas.drawPath(downArrowHead, arrowPaint);

    drawStaticMid(canvas, arrowPaint, center, arrowHeadSize);
  }

  void drawStaticMid(
      Canvas canvas, Paint arrowPaint, Offset center, double arrowHeadSize) {
    // **HORIZONTAL Arrow (>-)**
    Offset horStart = Offset(6 + offsetLeft, center.dy);
    Offset horEnd = Offset(6 + offsetLeft * 4, horStart.dy);
    canvas.drawLine(horStart, horEnd, arrowPaint);

    Path horizontalArrowHead = Path();
    horizontalArrowHead.moveTo(horStart.dx, horStart.dy - arrowHeadSize);
    horizontalArrowHead.lineTo(horStart.dx, horStart.dy + arrowHeadSize);
    horizontalArrowHead.lineTo(horStart.dx + arrowHeadSize, horStart.dy);
    horizontalArrowHead.close();
    canvas.drawPath(horizontalArrowHead, arrowPaint);

    // **Text next to Horizontal Arrow**
    double finalValue = double.parse(pickedValue.toStringAsFixed(1));
    final TextSpan textSpan = TextSpan(
      text: '${max(finalValue,0).toString()} $Unit',
      style: TextStyle(
        color: color ?? Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    );

    final TextPainter textPainter = TextPainter(
      text: textSpan,
      textDirection: TextDirection.ltr,
    );
    textPainter.layout();

    // Draw the text next to the horizontal arrow
    Offset textOffset =
        Offset(horEnd.dx + 10, horEnd.dy - textPainter.height / 2);
    textPainter.paint(canvas, textOffset);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
