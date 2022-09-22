import 'package:flutter/material.dart';

class AppElevatedButton extends StatelessWidget {
  const AppElevatedButton({
    this.onPressed,
    this.title,
    Key? key,
  }) : super(key: key);

  final VoidCallback? onPressed;
  final String? title;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      child: Text(title!),
    );
  }
}
