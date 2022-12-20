import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback func;
  const AppButton(
      {super.key, this.width, required this.text, required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: width,
        height: 25,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(12), bottomLeft: Radius.circular(12),),

            color: Theme.of(context).primaryColor),
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
