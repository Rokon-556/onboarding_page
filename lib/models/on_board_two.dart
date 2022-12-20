class OnBoardTwo {
  final String image, title, description, btnText;
  final Function btnFunc;
  final bool isEnable;

  OnBoardTwo(this.isEnable, {
    required this.image,
    required this.title,
    required this.description,
    required this.btnText,
    required this.btnFunc,
  });
}