import 'package:carservice/pages/catalog.dart';
import 'package:flutter/material.dart';

class HeaderCarDetail extends StatelessWidget {
  const HeaderCarDetail({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
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
          icon: const Icon(Icons.arrow_back),
          color: Colors.teal,
        ),
        const Text(
          'Car Detail',
          style: TextStyle(
              color: Colors.teal, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.menu,
          ),
          color: Colors.teal,
        ),
      ],
    ));
  }
}
