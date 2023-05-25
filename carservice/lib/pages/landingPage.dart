import 'package:flutter/material.dart';

import 'loginPage.dart';
import 'package:carservice/components/customizedText.dart';
import 'package:carservice/components/customizedButton.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({super.key});

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('images/background.png'), fit: BoxFit.cover),
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          top: 100.0,
          bottom: 0,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomizedText(
                  text: 'Premium ',
                  size: 50,
                  weight: FontWeight.bold,
                  color: Colors.white),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomizedText(
                  text: 'Car Rental ',
                  size: 40,
                  weight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 20,
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: CustomizedText(
                  text: 'Rent the car of your dreams',
                  size: 20,
                  weight: FontWeight.normal,
                  color: Color.fromARGB(255, 212, 211, 211)),
            ),
            const SizedBox(
              height: 100,
            ),
            const Image(
              image: AssetImage('images/yellowcar.png'),
              width: double.infinity,
            ),
            const SizedBox(
              height: 60,
            ),
            Center(
              child: CustomizedButton(
                text: 'Get Started',
                textcolor: Colors.black,
                weight: FontWeight.bold,
                color: Colors.white,
                fontsize: 20,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const LoginPage();
                      },
                    ),
                  );
                },
              ),
            )
          ],
        ),
      ),
    ));
  }
}
