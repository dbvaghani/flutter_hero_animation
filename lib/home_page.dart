import 'package:flutter/material.dart';
import 'package:hero_animations/details_page.dart';

import 'person.dart';

const people = [
  Person(name: "John", age: 20, emoji: "👨"),
  Person(name: "Jane", age: 21, emoji: "👩"),
  Person(name: "Jack", age: 22, emoji: "👦"),
  Person(name: "Jill", age: 23, emoji: "👧"),
];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hero Animation"),
      ),
      body: ListView.builder(
        itemCount: people.length,
        itemBuilder: (BuildContext context, int index) {
          final person = people[index];
          return ListTile(
            leading: Hero(
              tag: person.name,
              child: Text(
                person.emoji,
                style: const TextStyle(fontSize: 40),
              ),
            ),
            title: Text(person.name),
            subtitle: Text("${person.age} years old"),
            onTap: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      DetailsPage(person: person),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
