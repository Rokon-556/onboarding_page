import 'package:flutter/material.dart';

class OnBoardOne {
  final String image, title, description;
  final VoidCallback btnFunc;
  final VoidCallback leftFunc;
  final VoidCallback rightFunc;
  final bool isRight;
  final bool isLeft;
  final bool isBtn;

  OnBoardOne({
    required this.btnFunc,
    required this.isBtn,
    required this.leftFunc,
    required this.rightFunc,
    required this.isRight,
    required this.isLeft,
    required this.image,
    required this.title,
    required this.description,
  });
}
