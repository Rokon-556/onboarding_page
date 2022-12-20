import 'package:flutter/material.dart';

import '../models/on_board_two.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/on_board_content_two.dart';

class OnBoardingScreenTwo extends StatefulWidget {
  static const routeName = '/onboard-screen-two';
  const OnBoardingScreenTwo({super.key});

  @override
  State<OnBoardingScreenTwo> createState() => _OnBoardingScreenTwoState();
}

class _OnBoardingScreenTwoState extends State<OnBoardingScreenTwo> {
  late PageController _pageController;
  int _pageIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoardTwo> demoData = [
      OnBoardTwo(
        false,
        image: 'assets/images/onboard1.svg',
        title: 'All Problem One Solution',
        description: 'Need All groceries and Stationary Item? Here we go',
        btnText: 'Next',
        btnFunc: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
      OnBoardTwo(
        false,
        image: 'assets/images/onboard2.svg',
        title: 'Make Life Easier',
        description:
            'Here you will get all the products Like Electronics ,Grocery, Stationary',
        btnText: 'Next',
        btnFunc: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
      OnBoardTwo(
        true,
        image: 'assets/images/onboard3.svg',
        title: 'Unity Express',
        description:
            'Here you will get all the products of Unity Group and Excellent',
        btnText: 'Get Start',
        btnFunc: () {
          // Navigator.of(context).pushNamed(LoginScreen.routeName);
        },
      )
    ];

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Align(
              alignment: Alignment.topRight,
              child: TextButton(
                onPressed: () {
                  // Navigator.of(context).pushNamed(LoginScreen.routeName);
                },
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Expanded(
              child: PageView.builder(
                controller: _pageController,
                itemCount: demoData.length,
                onPageChanged: (index) {
                  setState(() {
                    _pageIndex = index;
                  });
                },
                itemBuilder: (context, index) => OnBoardContentTwo(
                  image: demoData[index].image,
                  title: demoData[index].title,
                  description: demoData[index].description,
                  btnText: demoData[index].btnText,
                  btnFunc: demoData[index].btnFunc,
                  btnEnable: demoData[index].isEnable,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 12.0),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                ...List.generate(
                  demoData.length,
                  (index) => Padding(
                    padding: const EdgeInsets.all(4),
                    child: DotIndicator(isActive: index == _pageIndex),
                  ),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }
}
