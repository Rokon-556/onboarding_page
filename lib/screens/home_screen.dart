import 'package:flutter/material.dart';
import 'package:on_boarding_demo/screens/on_board_screen_one.dart';
import 'package:on_boarding_demo/screens/on_board_screen_two.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.red[200],
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(OnBoardScreenOne.routeName);
                },
                child: const Text('Onboard One')),
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(OnBoardingScreenTwo.routeName);
                },
                child: const Text('Onboard Two'))
          ]),
        ),
      ),
    );
  }
}
