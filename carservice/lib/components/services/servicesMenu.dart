import 'package:carservice/components/customizedButton.dart';
import 'package:flutter/material.dart';

import '../../pages/endPage.dart';
import 'dropDown.dart';

class ServicesMain extends StatelessWidget {
  final Color color = Colors.grey;
  const ServicesMain({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22.0),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.65,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: const Color.fromARGB(255, 238, 237, 237),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Flexible(
                fit: FlexFit.tight,
                child: SingleChildScrollView(
                  child: Column(
                    children: const [
                      MyDropDownMenu(),
                    ],
                  ),
                ),
              ),
              CustomizedButton(
                color: Colors.teal,
                fontsize: 18,
                text: 'Request',
                textcolor: Colors.white,
                weight: FontWeight.bold,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return const EndPage();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
