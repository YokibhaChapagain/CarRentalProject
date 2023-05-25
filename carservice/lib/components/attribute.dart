import 'package:flutter/material.dart';

class Attributes extends StatelessWidget {
  const Attributes({
    Key? key,
    required this.name,
    required this.value,
  }) : super(key: key);

  final String name, value;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          value,
          style: const TextStyle(
              color: Colors.white, fontSize: 16, fontWeight: FontWeight.w500),
        ),
        Text(
          name,
          style: const TextStyle(color: Colors.white, fontSize: 12),
        )
      ],
    );
  }
}