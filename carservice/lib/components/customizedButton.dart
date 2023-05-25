import 'package:flutter/material.dart';


class CustomizedButton extends StatelessWidget {
  final FontWeight weight;
  final double fontsize;
  final String text;
  final Function() press;
  final Color color;
  final Color textcolor;
  const CustomizedButton(
      {super.key,
      required this.weight,
      required this.fontsize,
      required this.text,
      required this.press,
      required this.color,
      required this.textcolor,
      });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        minimumSize: const Size(360, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: press,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: weight,
          fontSize: fontsize,
          color: textcolor,
        ),
      ),
    );
  }
}
