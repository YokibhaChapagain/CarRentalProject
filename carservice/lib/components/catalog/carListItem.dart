import 'package:flutter/material.dart';

import 'carInformation.dart';
import '../../models/car.dart';
import '../../models/carList.dart';
import '../../pages/CarDetailsScreen.dart';

class CarListItem extends StatelessWidget {
  const CarListItem(
    this.index, {
    Key? key,
  }) : super(key: key);

  final int index;
  @override
  Widget build(BuildContext context) {
    Car car = carList[index];
    return GestureDetector(
      onTap: (() {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) {
            return CarDetailsScreen(
              car: car,
            );
          },
        ));
      }),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Container(
              width: MediaQuery.of(context).size.width * 0.9,
              margin: const EdgeInsets.only(bottom: 20),
              child: Stack(
                children: [
                  CarInformation(car: car),
                  Positioned(
                    bottom: 50,
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
            ),
          ),
        ],
      ),
    );
  }
}
