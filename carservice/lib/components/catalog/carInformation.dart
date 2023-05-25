import 'package:flutter/material.dart';

import '../../models/car.dart';
import '../attribute.dart';

class CarInformation extends StatelessWidget {
  const CarInformation({
    Key? key,
    required this.car,
  }) : super(key: key);

  final Car car;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 25),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
          color: const Color.fromARGB(255, 4, 56, 51),
          borderRadius: BorderRadius.circular(16)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '\$${car.price}',
            style: const TextStyle(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const Text(
            'price/hr',
            style: TextStyle(color: Colors.white),
          ),
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Attributes(
                value: car.brand,
                name: 'Brand',
              ),
              Attributes(
                value: car.model,
                name: 'Model No',
              ),
              Attributes(
                value: car.fuelCons,
                name: 'Fuel Cons',
              ),
            ],
          )
        ],
      ),
    );
  }
}
