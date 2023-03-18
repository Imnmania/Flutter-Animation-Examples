import 'package:flutter/material.dart';

import 'my_drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MyDrawer(
      drawer: Material(
        color: const Color(0xff24283b),
        child: ListView.builder(
          padding: const EdgeInsets.only(
            left: 80,
            top: 100,
          ),
          itemCount: 20,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text('Item $index'),
            );
          },
        ),
      ),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Home'),
          centerTitle: true,
          elevation: 0,
        ),
      ),
    );
  }
}
