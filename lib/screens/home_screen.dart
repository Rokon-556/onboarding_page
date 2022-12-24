import 'package:flutter/material.dart';
import 'package:on_boarding_demo/screens/on_board_screen_one.dart';
import 'package:on_boarding_demo/screens/on_board_screen_two.dart';
import 'package:provider/provider.dart';

import '../custom_theme.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final themeData = Provider.of<CustomTheme>(context);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('On Boarding Page'),
          actions: [
            IconButton(
              onPressed: themeData.toggler,
              icon: const Icon(Icons.brightness_4),
            )
          ],
        ),
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
                child: const Text('Onboard Two')),

            // ElevatedButton.icon(
            //     onPressed: () => currentTheme.toggleTheme(),
            //     // onPressed: () {
            //     //   currentTheme.addListener(() {
            //     //     setState(() {});
            //     //   });

            //     //   // Provider.of<CustomTheme>(context, listen: false)
            //     //   //     .toggleTheme();
            //     // },
            //     icon: const Icon(Icons.brightness_4),
            //     label: const Text('Enable'))
          ]),
        ),
      ),
    );
  }
}
