import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class MyDropDownMenu extends StatefulWidget {
  const MyDropDownMenu({super.key});

  @override
  _MyDropDownMenuState createState() => _MyDropDownMenuState();
}

class _MyDropDownMenuState extends State<MyDropDownMenu> {
  dynamic selectedItem;

  List<dynamic> items = [
    'Car Wash',
    'Tire Repair',
    'Mirror Change',
    'Servicing',
  ];

  List<dynamic> selectedItems = [];
  List<String> textFormFieldValues = [];

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Column(
        children: [
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              buttonHeight: 50,
              buttonWidth: 300,
              buttonDecoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                ),
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              itemHeight: 30,
              itemPadding: const EdgeInsets.symmetric(horizontal: 15),
              dropdownMaxHeight: 300,
              dropdownWidth: 300,
              dropdownDecoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
              ),
              buttonPadding: const EdgeInsets.symmetric(horizontal: 60),
              dropdownElevation: 8,
              scrollbarAlwaysShow: true,
              value: selectedItem,
              hint: const Text(
                'Select Services',
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
                overflow: TextOverflow.ellipsis,
              ),
              onChanged: (newValue) {
                setState(() {
                  if (newValue == "Other") {
                    selectedItems.add("");
                  } else {
                    selectedItem = newValue!;
                    selectedItems.add(selectedItem!);
                  }
                  selectedItem = null;
                });
              },
              items: [
                ...items.map((item) {
                  return DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                    ),
                  );
                }),
                const DropdownMenuItem<String>(
                  value: 'Other',
                  child: Text('Other'),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          if (selectedItems.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: SingleChildScrollView(
                child: Column(
                  children: selectedItems.asMap().entries.map((entry) {
                    var index = entry.key;
                    final item = entry.value;
                    return Container(
                      width: double.infinity,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 5),
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.circle,
                            color: Colors.teal,
                            size: 10,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: item is String && item.isEmpty
                                ? TextFormField(
                                    key: Key('$index'),
                                    initialValue: item,
                                    onFieldSubmitted: (value) {
                                      setState(() {
                                        selectedItems[index] = value;
                                        textFormFieldValues[index] = value;
                                      });
                                    },
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 11, 65, 60),
                                    ),
                                    decoration: const InputDecoration(
                                      contentPadding: EdgeInsets.all(0),
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none),
                                      hintText: 'Enter the service',
                                    ),
                                  )
                                : Text(
                                    item,
                                    style: const TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                      color: Color.fromARGB(255, 11, 65, 60),
                                    ),
                                  ),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                selectedItems.removeAt(index);
                              });
                            },
                            icon: const Icon(
                              Icons.clear,
                              color: Color.fromARGB(255, 2, 62, 110),
                            ),
                          ),
                        ],
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
