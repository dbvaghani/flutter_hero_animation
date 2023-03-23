import 'package:flutter/material.dart';

import 'person.dart';

class DetailsPage extends StatelessWidget {
  final Person person;
  const DetailsPage({required this.person, super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Hero(
          flightShuttleBuilder: (
            BuildContext flightContext,
            Animation<double> animation,
            HeroFlightDirection flightDirection,
            BuildContext fromHeroContext,
            BuildContext toHeroContext,
          ) {
            switch (flightDirection) {
              case HeroFlightDirection.push:
                return ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(begin: 0.0, end: 1.0).chain(
                      CurveTween(curve: Curves.fastOutSlowIn),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: toHeroContext.widget,
                  ),
                );
              case HeroFlightDirection.pop:
                return ScaleTransition(
                  scale: animation.drive(
                    Tween<double>(begin: 1.0, end: 0.0).chain(
                      CurveTween(curve: Curves.fastOutSlowIn),
                    ),
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: fromHeroContext.widget,
                  ),
                );
            }
          },
          tag: person.name,
          child: Text(
            person.emoji,
            style: const TextStyle(fontSize: 40),
          ),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(
              person.name,
              style: const TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 10),
            Text(
              "${person.age} years old",
              style: const TextStyle(fontSize: 20),
            ),
          ],
        ),
      ),
    );
  }
}
