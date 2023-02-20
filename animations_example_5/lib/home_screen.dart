import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

const defaultWidth = 100.0;

class _HomeScreenState extends State<HomeScreen> {
  var _isZoomedIn = false;
  var _buttonTitle = 'Zoom In';
  var _width = defaultWidth;
  var _curve = Curves.bounceOut;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: const Duration(milliseconds: 370),
              curve: _curve,
              width: _width,
              child: Image.asset(
                'assets/images/image.jpg',
                fit: BoxFit.fitWidth,
              ),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  _isZoomedIn = !_isZoomedIn;
                  _buttonTitle = !_isZoomedIn ? 'Zoom In' : 'Zoom Out';
                  _width = _isZoomedIn
                      ? MediaQuery.of(context).size.width
                      : defaultWidth;
                  // _curve = _isZoomedIn ? Curves.bounceOut : Curves.bounceIn;
                });
              },
              child: Text(_buttonTitle),
            ),
          ],
        ),
      ),
    );
  }
}
