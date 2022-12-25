import 'package:flutter/material.dart';

class AppButtonOne extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback func;
  const AppButtonOne(
      {super.key, this.width, required this.text, required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: width,
        height: 30,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(12),
              bottomLeft: Radius.circular(12),
            ),
            color: Colors.red),
        // color: Theme.of(context).primaryColor),
        child: Center(
          child: Text(
            text,
            style: const TextStyle(
                fontSize: 14, fontWeight: FontWeight.bold, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
