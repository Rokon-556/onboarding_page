import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_boarding_demo/widgets/app_button_two.dart';

class OnBoardContentTwo extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final String btnText;
  final Function btnFunc;
  final bool btnEnable;
  const OnBoardContentTwo({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.btnText,
    required this.btnFunc,
    required this.btnEnable,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 300,
          fit: BoxFit.cover,
        ),
        const SizedBox(height: 20),
        // const Spacer(),
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
        Visibility(
          visible: btnEnable,
          child: btnEnable? AppButtonTwo(
            width: 150,
            text: btnText,
            func: () {
              btnFunc();
            },
          ):Container(),
        ),
      ],
    );
  }
}
