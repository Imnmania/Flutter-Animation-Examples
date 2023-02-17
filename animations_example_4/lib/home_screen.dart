import 'package:animations_example_4/detail_screen.dart';
import 'package:animations_example_4/person.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('People'),
      ),
      body: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: people.length,
        itemBuilder: (context, index) {
          final person = people[index];
          return ListTile(
            leading: Hero(
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(
                  fontSize: 40,
                ),
              ),
            ),
            title: Text(person.name),
            subtitle: Text('${person.age} years old'),
            trailing: const Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    person: person,
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
