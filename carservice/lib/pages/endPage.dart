import 'package:carservice/components/customizedButton.dart';
import 'package:carservice/pages/dashboard.dart';
import '../components/customizedText.dart';
import 'package:flutter/material.dart';


class EndPage extends StatelessWidget {
  const EndPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('images/background.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 80),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: CustomizedText(
                    text: 'Thank you ',
                    size: 40,
                    weight: FontWeight.bold,
                    color: Colors.white),
              ),
              const Center(
                child: CustomizedText(
                    text: 'Your request has been approved ',
                    size: 20,
                    weight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CircleAvatar(
                  radius: 30,
                  backgroundColor: Colors.teal,
                  child: Icon(
                    Icons.check,
                    size: 50,
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Center(
                child: CustomizedText(
                    text: 'Enjoy your ride',
                    size: 20,
                    weight: FontWeight.bold,
                    color: Colors.white),
              ),
              const SizedBox(
                height: 50,
              ),
              const Center(
                child: CircleAvatar(
                  backgroundColor: Color.fromARGB(255, 122, 174, 168),
                  radius: 150,
                  child: Image(image: AssetImage('images/audi.png')),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              Center(
                child: CustomizedButton(
                    weight: FontWeight.bold,
                    fontsize: 18,
                    text: 'Go Back',
                    press: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return const DashBoard();
                          },
                        ),
                      );
                    },
                    color: Colors.teal,
                    textcolor: Colors.white),
              )
            ],
          ),
        ),
      ),
    );
  }
}
