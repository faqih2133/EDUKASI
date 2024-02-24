import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(MyApp1());
}

class MyApp1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Custom Line Chart',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Custom Line Chart'),
        ),
        body: Center(
          child: CustomLineChart(
            data: _generateData(),
            size: Size(400, 300),
            lineColor: Colors.blue,
          ),
        ),
      ),
    );
  }

  List<double> _generateData() {
    final List<double> data = [];
    for (int i = 0; i < 20; i++) {
      data.add(i * 5.0);
    }
    return data;
  }
}

class CustomLineChart extends StatelessWidget {
  final List<double> data;
  final Size size;
  final Color lineColor;

  const CustomLineChart({
    required this.data,
    required this.size,
    required this.lineColor,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size.width,
      height: size.height,
      child: CustomPaint(
        painter: LineChartPainter(data: data, lineColor: lineColor),
      ),
    );
  }
}

class LineChartPainter extends CustomPainter {
  final List<double> data;
  final Color lineColor;

  LineChartPainter({required this.data, required this.lineColor});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = lineColor
      ..strokeWidth = 2.0
      ..style = PaintingStyle.stroke;

    final double xInterval = size.width / (data.length - 1);
    final double maxValue = data.reduce(max);
    final double yInterval = size.height / maxValue;

    final Path path = Path();
    path.moveTo(0, size.height - data[0] * yInterval);

    for (int i = 1; i < data.length; i++) {
      final double x = i * xInterval;
      final double y = size.height - data[i] * yInterval;
      path.lineTo(x, y);
    }

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
