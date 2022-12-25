import 'dart:async';

import 'package:flutter/material.dart';
import 'package:on_boarding_demo/widgets/app_button_one.dart';
import 'package:on_boarding_demo/widgets/text_button.dart';

import '../models/on_board_one.dart';
import '../widgets/dot_indicator.dart';
import '../widgets/on_board_content_one.dart';

class OnBoardScreenOne extends StatefulWidget {
  static const routeName = '/splash-screen-one';
  const OnBoardScreenOne({
    super.key,
  });

  @override
  State<OnBoardScreenOne> createState() => _OnBoardScreenOneState();
}

class _OnBoardScreenOneState extends State<OnBoardScreenOne> {
  late PageController _pageController;
  int _pageIndex = 0;
  Timer? _timer;

  @override
  void initState() {
    _pageController = PageController(initialPage: 0);
    _timer = Timer.periodic(const Duration(seconds: 2), (Timer timer) {
      if (_pageIndex < 2) {
        _pageIndex++;
      } else {
        _pageIndex = 0;
      }

      _pageController.animateToPage(
        _pageIndex,
        duration: const Duration(milliseconds: 350),
        curve: Curves.easeIn,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  _buildButtonRow(Widget left, Widget right, Widget btn) {
    if (_pageIndex == 0) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(),
          Padding(
            padding: const EdgeInsets.only(right: 12.0),
            child: Align(alignment: Alignment.bottomRight, child: right),
          ),
        ],
      );
    } else if (_pageIndex == 1) {
      return (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(left: 12.0),
                child: left,
              )),
          Align(
              alignment: Alignment.bottomRight,
              child: Padding(
                padding: const EdgeInsets.only(right: 12.0),
                child: right,
              ))
        ],
      ));
    } else {
      return (Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 12.0),
            child: Align(alignment: Alignment.bottomLeft, child: left),
          ),
          Align(alignment: Alignment.bottomRight, child: btn)
        ],
      ));
    }
  }

  _nextPage() {
    _pageController.nextPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  _previousPage() {
    _pageController.previousPage(
        duration: const Duration(milliseconds: 300), curve: Curves.ease);
  }

  _loginPage() {
    //here go your code;
  }

  @override
  Widget build(BuildContext context) {
    final List<OnBoardOne> demoData = [
      OnBoardOne(
        image: 'assets/images/discount-3747.svg',
        title: 'All Problem One Solution',
        description: 'Need All groceries and Stationary Item? Here we go',
      ),
      OnBoardOne(
        image: 'assets/images/cart.svg',
        title: 'Make Life Easier',
        description:
            'Here you will get all the products Like Electronics ,Grocery, Stationary',
      ),
      OnBoardOne(
        image: 'assets/images/cash.svg',
        title: 'Unity Express',
        description:
            'Here you will get all the products of Unity Group and Excellent',
      )
    ];
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          Align(
            alignment: Alignment.topRight,
            child: TextButton(
              onPressed: () {},
              child: const Text(
                'Skip',
                style: TextStyle(
                    color: Colors.redAccent, fontWeight: FontWeight.bold),
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
              itemBuilder: (context, index) => OnBoardContentOne(
                image: demoData[index].image,
                title: demoData[index].title,
                description: demoData[index].description,
              ),
            ),
          ),
          _buildButtonRow(
            TextButtonClass(
              btnText: 'Previous',
              btnFunc: _previousPage,
            ),
            TextButtonClass(
              btnText: 'Next',
              btnFunc: _nextPage,
            ),
            AppButtonOne(
              text: 'Get Start',
              func: _loginPage,
              width: 100,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12.0),
            child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
      )),
    );
  }
}
