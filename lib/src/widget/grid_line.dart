import 'package:flutter/material.dart';

class GridLine extends CustomPainter {
  final int width;
  final int height;
  final Color color;

  GridLine({
    this.width = 3,
    this.height = 3,
    this.color = Colors.white,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final Paint paint = Paint()
      ..color = color
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.fill
      ..strokeWidth = 0.5;
    for (int i = 1; i < width; i++) {
      final x = (size.width / width) * i;
      canvas.drawLine(Offset(x, 0), Offset(x, size.height), paint);
    }
    for (int i = 1; i < height; i++) {
      final y = (size.height / height) * i;
      canvas.drawLine(Offset(0, y), Offset(size.width, y), paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}