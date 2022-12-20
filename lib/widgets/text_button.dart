import 'package:flutter/material.dart';

class TextButtonClass extends StatelessWidget {
  final String btnText;

  final VoidCallback btnFunc;
  const TextButtonClass({
    super.key,
    required this.btnText,
    required this.btnFunc,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: btnFunc,
      child: Container(
        height: 25,
        child: Center(
          child: Text(
            btnText,
            style: TextStyle(
                color: Theme.of(context).primaryColor,
                fontSize: 14,
                fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
  }
}
