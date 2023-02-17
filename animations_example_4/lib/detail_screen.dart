import 'package:animations_example_4/person.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatelessWidget {
  final Person person;
  const DetailScreen({
    super.key,
    required this.person,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          tag: person.name,
          flightShuttleBuilder: (
            flightContext,
            animation,
            flightDirection,
            fromHeroContext,
            toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return Material(
                    color: Colors.transparent, child: toHeroContext.widget);
              case HeroFlightDirection.pop:
                return Material(
                    color: Colors.transparent, child: fromHeroContext.widget);
            }
          },
          child: Material(
            color: Colors.transparent,
            child: Text(
              person.emoji,
              style: const TextStyle(
                fontSize: 40,
              ),
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              person.name,
              style: const TextStyle(fontSize: 30),
            ),
            const SizedBox(height: 20),
            Text(
              '${person.age} years old',
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
