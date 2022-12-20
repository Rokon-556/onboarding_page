import 'package:flutter/material.dart';

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
    final List<OnBoardOne> demoData = [
      OnBoardOne(
        isBtn: false,
        isRight: true,
        isLeft: false,
        image: 'assets/images/discount-3747.svg',
        title: 'All Problem One Solution',
        description: 'Need All groceries and Stationary Item? Here we go',
        leftFunc: () {},
        btnFunc: () {},
        rightFunc: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
      ),
      OnBoardOne(
        leftFunc: () {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        btnFunc: () {},
        rightFunc: () {
          _pageController.nextPage(
              duration: const Duration(milliseconds: 300), curve: Curves.ease);
        },
        isBtn: false,
        isRight: true,
        isLeft: true,
        image: 'assets/images/cart.svg',
        title: 'Make Life Easier',
        description:
            'Here you will get all the products Like Electronics ,Grocery, Stationary',
      ),
      OnBoardOne(
        leftFunc: () {
          _pageController.previousPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.ease,
          );
        },
        btnFunc: () {},
        rightFunc: () {},
        isBtn: true,
        isLeft: true,
        isRight: false,
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
              itemBuilder: (context, index) => OnBoardContentOne(
                image: demoData[index].image,
                title: demoData[index].title,
                description: demoData[index].description,
                leftEnable: demoData[index].isLeft,
                rightEnable: demoData[index].isRight,
                isBtnEnable: demoData[index].isBtn,
                btnFunc: demoData[index].btnFunc,
                leftFunc: demoData[index].leftFunc,
                rightFunc: demoData[index].rightFunc,
              ),
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