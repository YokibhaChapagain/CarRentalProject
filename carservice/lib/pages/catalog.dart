import 'package:carservice/components/customizedText.dart';
import 'package:flutter/material.dart';

import '../components/catalog/CarModelCard.dart';
import '../components/catalog/carListItem.dart';
import '../components/footer.dart';
import '../models/carList.dart';
import '../models/carModel.dart';

class Catalog extends StatelessWidget {
  const Catalog({Key? key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Scaffold(
        backgroundColor: Colors.teal,
        body: Column(
          children: [
            const Center(
                child: Padding(
              padding: EdgeInsets.only(top: 40.0, bottom: 20),
              child: CustomizedText(
                  text: 'Available Car',
                  size: 20,
                  weight: FontWeight.bold,
                  color: Colors.white),
            )),
            SizedBox(
              height: 160,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: carList.length,
                itemBuilder: (context, index) => CarListItem(index),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 50.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const CustomizedText(
                    text: 'All Cars',
                    size: 20,
                    weight: FontWeight.w500,
                    color: Colors.white,
                  ),
                  Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: const Color.fromARGB(255, 5, 91, 82),
                    ),
                    child: const Icon(
                      Icons.filter_alt,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 50.0),
              child: Divider(
                height: 10,
                color: Colors.black,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Expanded(
              child: SizedBox(
                width: 380,
                child: ListView.builder(
                  itemCount: carmodel.length,
                  itemBuilder: (context, index) => CarModelCard(
                    carModel: carmodel[index],
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 80,
            ),
          ],
        ),
      ),
      const Positioned(
        left: 0,
        right: 0,
        bottom: 0,
        child: Footer(index: 0),
      ),
    ]);
  }
}
