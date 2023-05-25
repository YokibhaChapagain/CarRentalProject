import 'package:flutter/material.dart';

class RadioButton extends StatefulWidget {
  const RadioButton({super.key});

  @override
  State<RadioButton> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<RadioButton> {
  int selectedRadio = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 1,
            groupValue: selectedRadio,
            title: const Text("Private"),
            onChanged: (newValue) {
              setState(() {
                selectedRadio = newValue!;
              });
            },
            activeColor: Colors.black,
          ),
        ),
        Expanded(
          child: RadioListTile(
            contentPadding: EdgeInsets.zero,
            value: 2,
            groupValue: selectedRadio,
            title: const Text("Organization"),
            onChanged: (newValue) {
              setState(() {
                selectedRadio = newValue!;
              });
            },
            activeColor: Colors.black,
          ),
        ),
      ],
    );
  }
}