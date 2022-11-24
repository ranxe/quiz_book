import 'package:flutter/material.dart';

class ColorSelector extends StatelessWidget {
  const ColorSelector({
    Key? key,
    required this.selectedColor,
    required this.numColor,
    required this.pallete,
    required this.onPressed,
    this.height,
  }) : super(key: key);

  final Color selectedColor;
  final int numColor;
  final List<Color> pallete;
  final Function onPressed;
  final double? height;

  Widget colorButton({required Color color}){
    return OutlinedButton(
      style : OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        backgroundColor: color,
        foregroundColor : Colors.grey,
      ),
      onPressed: () => onPressed(color),
      child: color == selectedColor ? const Icon(Icons.check) : const Text('')
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height : height ?? 40,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: List.generate(9, (int index) {
              return colorButton(color: pallete[index]);
          }),
        ),
      );
  }
}