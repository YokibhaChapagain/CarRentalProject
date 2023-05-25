import 'package:carservice/components/dashboard/slideHistory.dart';
import 'package:flutter/material.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  CarouselState createState() => CarouselState();
}

class CarouselState extends State<Carousel> {
  int currentIndex = 0;
  int pageNo = 0;
  List<String> item = ["item 1", "Item 2", "Item 3"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 125,
          child: PageView.builder(
            onPageChanged: (index) {
              pageNo = index;
              setState(() {});
            },
            scrollDirection: Axis.horizontal,
            itemCount: item.length,
            itemBuilder: (context, index) {
              return Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 8),
                child: Column(
                  children: const [
                    SlideHistory(
                      carNumber: 'BA 3245 PA 23',
                      date: '01/02/2023',
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Divider(
                      height: 3,
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    SlideHistory(
                      carNumber: 'BA 3245 PA 23',
                      date: '01/02/2023',
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            3,
            (index) => Container(
              padding: const EdgeInsets.only(bottom: 10),
              margin: const EdgeInsets.all(2),
              child: Icon(Icons.circle,
                  size: 12,
                  color: pageNo == index
                      ? Colors.black
                      : const Color.fromARGB(255, 221, 221, 221)),
            ),
          ),
        ),
      ],
    );
  }
}
