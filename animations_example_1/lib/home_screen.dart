import 'dart:math' show pi;

import 'package:flutter/material.dart';

/* 
  0.0 = 0 degrees
  0.5 = 180 degrees
  1.0 = 360 degrees
 */

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );
    _animation = Tween<double>(begin: 0.0, end: 2 * pi).animate(_controller);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Transform(
          alignment: Alignment.center,
          transform: Matrix4.identity()..rotateZ(0.1),
          child: Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  offset: Offset(0, 3),
                  blurRadius: 5,
                  spreadRadius: 3,
                  color: Colors.black54,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
