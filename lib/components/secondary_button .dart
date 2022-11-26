import 'package:flutter/material.dart';
import 'package:quiz_book/constant/constant.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.onPressed,
    required this.text,
  }) : super(key: key);

  final Function onPressed;
  final String text;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
        backgroundColor: secondaryColor,
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(text)
    );
  }
}