import '../../models/carModel.dart';
import 'package:flutter/material.dart';

class CarModelCard extends StatelessWidget {
  final CarModel carModel;
  const CarModelCard({super.key, required this.carModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          height: MediaQuery.of(context).size.height * 0.15,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: const Color.fromARGB(255, 110, 180, 174)),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      carModel.title,
                      style: const TextStyle(
                          fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      carModel.subtitle,
                      style: const TextStyle(height: 1.5),
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: 200,
                  height: 25,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(10),
                          bottomLeft: Radius.circular(15)),
                      color: Color.fromARGB(255, 5, 91, 82)),
                  child: Text(
                    carModel.price,
                    style: const TextStyle(
                        fontSize: 15,
                        height: 1.5,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ),
              ),
              Positioned(
                right: 20,
                child: Image.asset(
                  carModel.image,
                  height: 100,
                  width: 160,
                  fit: BoxFit.fill,
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
