import 'package:animations_example_9/animated_prompt.dart';
import 'package:animations_example_9/home_screen.dart';
import 'package:flutter/material.dart';

/// -----------------------
/// ALERT DIALOG ANIMATION
/// -----------------------

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const HomeScreen(),
    );
  }
}
