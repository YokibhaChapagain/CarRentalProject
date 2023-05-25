import 'package:flutter/material.dart';

import '../components/catalog/HeaderCarDetail.dart';
import '../components/customizedButton.dart';
import '../components/attribute.dart';
import '../models/car.dart';

class CarDetailsScreen extends StatelessWidget {
  final Car car;
  const CarDetailsScreen({Key? key, required this.car}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'images/map.png',
            width: double.infinity,
            fit: BoxFit.fill,
          ),
          const HeaderCarDetail(),
          Positioned(
            left: 25,
            right: 25,
            bottom: 25,
            child: Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.only(top: 50),
              decoration: BoxDecoration(
                color: Colors.teal,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '\$${car.price}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text(
                    'price/hr',
                    style: TextStyle(color: Colors.white),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Attributes(value: car.brand, name: 'Brand'),
                      Attributes(value: car.model, name: 'Model No'),
                      Attributes(value: car.fuelCons, name: 'Fuel Cons'),
                    ],
                  ),
                  const SizedBox(height: 20),
                  CustomizedButton(
                    color: Colors.white,
                    textcolor: Colors.teal,
                    weight: FontWeight.bold,
                    fontsize: 14,
                    text: 'Book Now',
                    press: () async {
                      final selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(DateTime.now().year + 1),
                      );

                      if (selectedDate != null) {
                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            return AlertDialog(
                              content: Row(
                                children: const [
                                  Icon(
                                    Icons.check_circle,
                                    color: Colors.green,
                                    size: 40,
                                  ),
                                  SizedBox(width: 16),
                                  Text(
                                    'Your vehicle has been booked',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              actions: [
                                Center(
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                      primary: Colors.teal, // Background color
                                    ),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 140,
            right: 80,
            child: Image.asset(
              car.image,
              fit: BoxFit.fill,
              height: 100,
              width: 160,
            ),
          ),
        ],
      ),
    );
  }
}
