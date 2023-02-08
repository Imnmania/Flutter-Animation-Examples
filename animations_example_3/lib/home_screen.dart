import 'dart:math' show pi;

import 'package:flutter/material.dart';
import 'package:vector_math/vector_math_64.dart' show Vector3;

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const widthAndHeight = 100.0;

class _HomeScreenState extends State<HomeScreen> with TickerProviderStateMixin {
  late AnimationController _xController;
  late AnimationController _yController;
  late AnimationController _zController;

  late Tween<double> _animation;

  @override
  void initState() {
    _xController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 20),
    );

    _yController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 30),
    );

    _zController = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 40),
    );

    _animation = Tween<double>(
      begin: 0,
      end: pi * 2,
    );

    _xController
      ..reset()
      ..repeat();

    _yController
      ..reset()
      ..repeat();

    _zController
      ..reset()
      ..repeat();

    super.initState();
  }

  @override
  void dispose() {
    _xController.dispose();
    _yController.dispose();
    _zController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: widthAndHeight,
              width: double.infinity,
            ),
            AnimatedBuilder(
              animation: Listenable.merge([
                _xController,
                _yController,
                _zController,
              ]),
              builder: (context, child) {
                return Transform(
                  alignment: Alignment.center,
                  transform: Matrix4.identity()
                    ..rotateX(_animation.evaluate(_xController))
                    ..rotateY(_animation.evaluate(_yController))
                    ..rotateZ(_animation.evaluate(_zController)),
                  child: Stack(
                    children: [
                      //? back
                      Transform(
                        alignment: Alignment.center,
                        transform: Matrix4.identity()
                          ..translate(
                            Vector3(0, 0, -widthAndHeight),
                          ),
                        child: Container(
                          height: widthAndHeight,
                          width: widthAndHeight,
                          color: Colors.purple,
                        ),
                      ),
                      //? left side
                      Transform(
                        alignment: Alignment.centerLeft,
                        transform: Matrix4.identity()..rotateY(pi / 2),
                        child: Container(
                          height: widthAndHeight,
                          width: widthAndHeight,
                          color: Colors.yellow,
                        ),
                      ),
                      //? right side
                      Transform(
                        alignment: Alignment.centerRight,
                        transform: Matrix4.identity()..rotateY(-pi / 2),
                        child: Container(
                          height: widthAndHeight,
                          width: widthAndHeight,
                          color: Colors.blue,
                        ),
                      ),
                      //? front
                      Container(
                        height: widthAndHeight,
                        width: widthAndHeight,
                        color: Colors.green,
                      ),
                      //? top side
                      Transform(
                        alignment: Alignment.topCenter,
                        transform: Matrix4.identity()..rotateX(-pi / 2),
                        child: Container(
                          height: widthAndHeight,
                          width: widthAndHeight,
                          color: Colors.orange,
                        ),
                      ),
                      //? bottom side
                      Transform(
                        alignment: Alignment.bottomCenter,
                        transform: Matrix4.identity()..rotateX(pi / 2),
                        child: Container(
                          height: widthAndHeight,
                          width: widthAndHeight,
                          color: Colors.cyan,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
