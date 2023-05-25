import 'package:flutter/material.dart';

import '../customizedText.dart';

class SlideHistory extends StatelessWidget {
  final String date;
  final String carNumber;

  const SlideHistory({
    Key? key,
    required this.date,
    required this.carNumber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: const [
                CustomizedText(
                    text: '01/02/2023 - 01/06/2023',
                    size: 15,
                    weight: FontWeight.w500,
                    color: Colors.black),
                SizedBox(
                  width: 70,
                ),
                CustomizedText(
                    text: '5 months',
                    size: 15,
                    weight: FontWeight.w500,
                    color: Colors.grey)
              ],
            ),
            const CustomizedText(
              text: 'BA 3245 PA 23',
              size: 15,
              weight: FontWeight.w400,
              color: Colors.teal,
            )
          ],
        ),
      ],
    );
  }
}
