import 'package:carservice/components/dashboard/radioButton.dart';
import 'package:flutter/material.dart';

import '../customizedText.dart';

class EditDetailsDialog extends StatefulWidget {
  final String carModel;
  final String carNumber;
  final Function(String) onUpdateCarNumber;
  final Function(String) onUpdateCarModel;

  const EditDetailsDialog(
      {Key? key,
      required this.carModel,
      required this.carNumber,
      required this.onUpdateCarNumber,
      required this.onUpdateCarModel})
      : super(key: key);

  @override
  EditDetailsDialogState createState() => EditDetailsDialogState();
}

class EditDetailsDialogState extends State<EditDetailsDialog> {
  late String _carModel;
  late String _carNumber;
  late TextEditingController _carNumberController;
  late TextEditingController _carModelController;

  @override
  void initState() {
    _carModel = widget.carModel;
    _carNumber = widget.carNumber;
    _carNumberController = TextEditingController(text: _carNumber);
    _carModelController = TextEditingController(text: _carModel);
    super.initState();
  }

  @override
  void dispose() {
    _carNumberController.dispose();
    _carModelController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      elevation: 10,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      title: const CustomizedText(
        text: 'Edit Details',
        size: 20,
        weight: FontWeight.bold,
        color: Colors.teal,
      ),
      content: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            const CustomizedText(
              text: 'Car Model:',
              size: 15,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _carModelController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: ((value) {
                setState(() {
                  _carModel = value;
                });
              }),
            ),
            const SizedBox(height: 16),
            const CustomizedText(
              text: 'Car Number:',
              size: 15,
              weight: FontWeight.bold,
              color: Colors.black,
            ),
            const SizedBox(height: 8),
            TextField(
              controller: _carNumberController,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
              ),
              onChanged: ((value) {
                setState(() {
                  _carNumber = value;
                });
              }),
            ),
            const SizedBox(
              height: 10,
            ),
            const RadioButton(),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.teal),
          ),
        ),
        ElevatedButton(
          onPressed: () {
            widget.onUpdateCarModel(_carModel);
            widget.onUpdateCarNumber(_carNumber);
            Navigator.of(context).pop();
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.teal,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),
          ),
          child: const Text('Save'),
        ),
      ],
    );
  }
}
