import 'package:flutter/material.dart';
import 'package:quiz_book/constant/constant.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
        backgroundColor: primaryColor,
      ),
      onPressed: () {
        onPressed();
      },
      child: Text(text,
        style : const TextStyle(color: Colors.white)),
    );
  }
}