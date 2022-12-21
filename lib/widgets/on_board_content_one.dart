import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_boarding_demo/widgets/app_button_one.dart';
import 'package:on_boarding_demo/widgets/text_button.dart';

class OnBoardContentOne extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  // final VoidCallback btnFunc;
  // final VoidCallback leftFunc;
  // final VoidCallback rightFunc;
  // final bool leftEnable;
  // final bool rightEnable;
  // final bool isBtnEnable;

  const OnBoardContentOne({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    // required this.leftEnable,
    // required this.rightEnable,
    // required this.isBtnEnable,
    // required this.btnFunc,
    // required this.leftFunc,
    // required this.rightFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 200,
          width: double.infinity,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        Text(
          title,
          textAlign: TextAlign.center,
          style: Theme.of(context)
              .textTheme
              .headlineSmall!
              .copyWith(fontWeight: FontWeight.w500),
        ),
        const SizedBox(
          height: 12,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(description,
              style: const TextStyle(
                fontSize: 16,
              )),
        ),
        const Spacer(),
        const SizedBox(height: 12),
      ],
    );
  }
}
