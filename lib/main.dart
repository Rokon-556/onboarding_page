import 'package:flutter/material.dart';
import 'package:on_boarding_demo/custom_theme.dart';
import 'package:on_boarding_demo/screens/home_screen.dart';
import 'package:on_boarding_demo/screens/on_board_screen_one.dart';
import 'package:on_boarding_demo/screens/on_board_screen_two.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CustomTheme(),
      builder: (context, child) {
        final themeData = Provider.of<CustomTheme>(context);
        return MaterialApp(
          theme: themeData.theme,

          //  theme: themeData.light,
          //  darkTheme: themeData.dark,
          // themeMode: themeData.theme,
          home: const HomeScreen(),
          routes: {
            OnBoardScreenOne.routeName: ((context) => const OnBoardScreenOne()),
            OnBoardingScreenTwo.routeName: ((context) =>
                const OnBoardingScreenTwo()),
          },
        );
      },
      // child: MaterialApp(
      //   title: 'Flutter Demo',
      //   home: const HomeScreen(),
      //   theme: CustomTheme.lightTheme,
      //   darkTheme: CustomTheme.darkTheme,
      //   themeMode: currentTheme.currentTheme,
      //   routes: {
      //     OnBoardScreenOne.routeName: ((context) => const OnBoardScreenOne()),
      //     OnBoardingScreenTwo.routeName: ((context) =>
      //         const OnBoardingScreenTwo()),
      //   },
      // ),
    );
  }
}
