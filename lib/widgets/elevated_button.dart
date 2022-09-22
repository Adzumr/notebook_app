import 'package:flutter/material.dart';
import 'package:notebook/main.dart';

class AppTextButton extends StatelessWidget {
  const AppTextButton({
    this.onPressed,
    this.title,
    this.textColor,
    Key? key,
  }) : super(key: key);

  final String? title;
  final VoidCallback? onPressed;
  final Color? textColor;
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        title!,
        style: TextStyle(color: textColor ?? appColors.blueColor),
      ),
    );
  }
}
