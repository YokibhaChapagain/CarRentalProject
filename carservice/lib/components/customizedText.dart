import 'package:flutter/material.dart';

class CustomizedText extends StatelessWidget {
  final String text;
  final double size;
  final FontWeight weight;
  final Color color;
  const CustomizedText(
      {super.key,
      required this.text,
      required this.size,
      required this.weight,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        decoration: TextDecoration.none,
        fontSize: size,
        fontFamily: 'Arial',
        fontWeight: weight,
        color: color,
      ),
    );
  }
}
