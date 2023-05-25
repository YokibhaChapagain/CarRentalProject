class CarModel {
  final String title, subtitle, price, image, year, text1, text2, text3, text4;

  const CarModel(
      {required this.title,
      required this.subtitle,
      required this.price,
      required this.image,
      required this.year,
      required this.text1,
      required this.text2,
      required this.text3,
      required this.text4});
}

List<CarModel> carmodel = [
  const CarModel(
      title: 'Buggati',
      subtitle: 'Automobile',
      price: '\$200/day',
      image: 'images/car2.png',
      year: '2020',
      text1: '500km',
      text2: 'Automatic',
      text3: 'Diesel',
      text4: '5 seats'),
  const CarModel(
      title: 'Lamborghini',
      subtitle: 'Automobile',
      price: '\$500/day',
      image: 'images/car4.png',
      year: '2022',
      text1: '400km',
      text2: 'Manual',
      text3: 'Diesel',
      text4: '4 seats'),
  const CarModel(
      title: 'Ferrari',
      subtitle: 'Automobile',
      price: '\$200/day',
      image: 'images/car3.png',
      year: '2012',
      text1: '600km',
      text2: 'Manual',
      text3: 'Diesel',
      text4: '4 seats'),
  const CarModel(
      title: 'Toyota',
      subtitle: 'Automobile',
      price: '\$300/day',
      image: 'images/car1.png',
      year: '2020',
      text1: '500km',
      text2: 'Automatic',
      text3: 'Diesel',
      text4: '5 seats'),
];
