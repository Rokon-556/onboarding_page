import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:on_boarding_demo/widgets/app_button.dart';
import 'package:on_boarding_demo/widgets/text_button.dart';

class OnBoardContent extends StatelessWidget {
  final String image;
  final String title;
  final String description;
  final VoidCallback btnFunc;
  final VoidCallback leftFunc;
  final VoidCallback rightFunc;
  final bool leftEnable;
  final bool rightEnable;
  final bool isBtnEnable;

  const OnBoardContent({
    Key? key,
    required this.image,
    required this.title,
    required this.description,
    required this.leftEnable,
    required this.rightEnable,
    required this.isBtnEnable,
    required this.btnFunc,
    required this.leftFunc,
    required this.rightFunc,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SvgPicture.asset(
          image,
          height: 300,
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
        Padding(
          padding: const EdgeInsets.only(
            bottom: 8.0,
          ),
          child: Row(
            children: [
              Visibility(
                  visible: leftEnable,
                  child: Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 12.0),
                        child: TextButtonClass(
                            btnText: 'Previous', btnFunc: leftFunc),
                      ))),
              const Spacer(),
              Visibility(
                  visible: rightEnable,
                  child: Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12.0),
                        child: TextButtonClass(
                            btnText: 'Next', btnFunc: rightFunc),
                      ))),
              Visibility(
                visible: isBtnEnable,
                child: Align(
                  alignment: Alignment.bottomRight,
                  child: AppButton(
                    text: 'Let\'s go',
                    func: btnFunc,
                    width: 100,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
