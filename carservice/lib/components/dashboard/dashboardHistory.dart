import 'package:flutter/material.dart';

import 'Carousel.dart';
import '../customizedText.dart';

class HistoryBody extends StatelessWidget {
  const HistoryBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: 230,
        width: double.infinity,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12), color: Colors.white),
        child: Padding(
          padding: const EdgeInsets.only(left: 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Padding(
                padding: EdgeInsets.only(top: 20),
                child: Center(
                  child: CustomizedText(
                      text: 'History',
                      size: 25,
                      weight: FontWeight.normal,
                      color: Colors.teal),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Carousel(),
            ],
          ),
        ),
      ),
    );
  }
}
