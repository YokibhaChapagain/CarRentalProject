import 'package:carservice/pages/Service.dart';
import 'package:carservice/pages/catalog.dart';
import 'package:carservice/pages/dashboard.dart';

import 'package:flutter/material.dart';

class Footer extends StatefulWidget {
  const Footer({Key? key, int this.index = 2}) : super(key: key);

  final int? index;

  @override
  State<Footer> createState() => _FooterState();
}

int _currentIndex = 1;

class _FooterState extends State<Footer> {
  final List<Widget> pages = [
    const Catalog(),
    const DashBoard(),
    const Service(),
  ];

  @override
  void initState() {
    super.initState();
    setState(() {
      _currentIndex = widget.index ?? 1;
    });
  }

  void _onTap(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => pages[index]),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      backgroundColor: const Color.fromARGB(255, 7, 52, 47),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.grey,
      showUnselectedLabels: true,
      currentIndex: _currentIndex,
      onTap: _onTap,
      type: BottomNavigationBarType.fixed,
      items: [
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.article_sharp,
          ),
          label: 'Catalog',
        ),
        BottomNavigationBarItem(
          icon: Container(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: _currentIndex == 1
                    ? Colors.teal
                    : const Color.fromARGB(255, 177, 177, 177)),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.home,
                color: Colors.white,
              ),
            ),
          ),
          label: 'Home',
        ),
        const BottomNavigationBarItem(
          icon: Icon(
            Icons.car_rental,
          ),
          label: 'Service',
        ),
      ],
    );
  }
}
