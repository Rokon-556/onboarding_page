import 'package:flutter/material.dart';

class AppButtonTwo extends StatelessWidget {
  final double? width;
  final String text;
  final VoidCallback func;
  const AppButtonTwo(
      {super.key, this.width, required this.text, required this.func});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: func,
      child: Container(
        width: width,
        height: 45,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Theme.of(context).primaryColor),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              text,
              style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Icon(
              Icons.arrow_right_alt,
              color: Colors.white,
              size: 20,
              weight: 20,
            ),
          ],
        ),
      ),
    );
  }
}
