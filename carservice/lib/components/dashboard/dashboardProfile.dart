import 'package:carservice/pages/catalog.dart';
import 'package:flutter/material.dart';

import '../customizedText.dart';
import 'editDetails.dart';

class ProfileBody extends StatefulWidget {
  const ProfileBody({Key? key}) : super(key: key);

  @override
  State<ProfileBody> createState() => _ProfileBodyState();
}

class _ProfileBodyState extends State<ProfileBody> {
  String carModel = 'Range Rover';
  String carNumber = 'BA 1533 P 205';
  TextEditingController carNumberController = TextEditingController();
  TextEditingController carModelController = TextEditingController();

  @override
  void initState() {
    super.initState();
    carNumberController.text = carNumber;
    carModelController.text = carModel;
  }

  @override
  void dispose() {
    carNumberController.dispose();
    carModelController.dispose();
    super.dispose();
  }

  void updateCarNumber(String newCarNumber) {
    setState(() {
      carNumber = newCarNumber;
    });
  }

  void updateCarModel(String newCarModel) {
    setState(() {
      carModel = newCarModel;
    });
  }

  void _showOtherVehicles(BuildContext context) {
    showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        builder: (BuildContext context) {
          return Container();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.36,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: Colors.white,
        ),
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const CustomizedText(
                      text: 'My Profile',
                      size: 25,
                      weight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    const SizedBox(height: 20),
                    SizedBox(
                      width: 250,
                      height: 140,
                      child: Stack(
                        children: [
                          Image.asset(
                            'images/profileimage.png',
                            fit: BoxFit.fill,
                          ),
                          const Positioned(
                            top: 112,
                            right: 108,
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.green,
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    CustomizedText(
                      text: carModel,
                      size: 18,
                      weight: FontWeight.bold,
                      color: Colors.teal,
                    ),
                    CustomizedText(
                        text: carNumber,
                        size: 12,
                        weight: FontWeight.w500,
                        color: Colors.black),
                  ],
                ),
              ),
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextButton(
                        onPressed: () {
                          showDialog(
                            context: context,
                            builder: (context) => EditDetailsDialog(
                              carModel: carModel,
                              carNumber: carNumber,
                              onUpdateCarNumber: updateCarNumber,
                              onUpdateCarModel: updateCarModel,
                            ),
                          );
                        },
                        child: const Text(
                          'Edit Details',
                          style: TextStyle(color: Colors.teal, fontSize: 15),
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return const Catalog();
                              },
                            ),
                          );
                        },
                        child: const Text(
                          'Other Vehicle',
                          style: TextStyle(color: Colors.teal, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
