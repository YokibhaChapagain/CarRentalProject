import 'package:carservice/components/customizedText.dart';
import 'package:carservice/components/services/servicesMenu.dart';
import 'package:flutter/material.dart';

import '../components/footer.dart';

class Service extends StatelessWidget {
  const Service({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: const Color.fromARGB(255, 110, 180, 174),
        body: SingleChildScrollView(
          child: Column(
            children: const [
              SizedBox(
                height: 50,
              ),
              CustomizedText(
                  text: 'Choose the Service ',
                  size: 25,
                  weight: FontWeight.bold,
                  color: Colors.white),
              SizedBox(
                height: 30,
              ),
              ServicesMain(),
            ],
          ),
        ),
      ),
      const Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Footer(index: 2),
      ),
    ]);
  }
}
