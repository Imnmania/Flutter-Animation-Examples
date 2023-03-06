import 'dart:math';

import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CustomPaint(
          painter: Polygon(sides: 10),
          child: SizedBox(
            height: MediaQuery.of(context).size.width,
            width: MediaQuery.of(context).size.width,
          ),
        ),
      ),
    );
  }
}

class Polygon extends CustomPainter {
  final int sides;

  Polygon({
    required this.sides,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeWidth = 2;

    final path = Path();

    final center = Offset(size.width / 2, size.height / 2);
    final angle = (2 * pi) / sides;

    final angles = List.generate(sides, (index) => index * angle);
    final radius = size.width / 2;
    /**
     * x = center.x + radius * cos(angle)
     * y = center.y + radius * sin(angle)
     */
    path.moveTo(
      center.dx + radius * cos(0),
      center.dy + radius * sin(0),
    );

    for (final angle in angles) {
      path.lineTo(
        center.dx + radius * cos(angle),
        center.dy + radius * sin(angle),
      );
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate is Polygon && oldDelegate.sides != sides;
  }
}
