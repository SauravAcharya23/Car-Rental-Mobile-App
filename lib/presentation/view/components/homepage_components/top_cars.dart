
import 'package:car_rental_app/presentation/view/components/homepage_components/car_card.dart';
import 'package:flutter/material.dart';

class TopCars extends StatefulWidget {
  const TopCars({super.key});

  @override
  State<TopCars> createState() => _TopCarsState();
}

class _TopCarsState extends State<TopCars> {

  List<Map<String, String>> topCars = [
    {"name": "Maserati 867", "image": "lib/images/car1.png","ratings": "4.5", "engine_type":"Petrol","price": "540"},
    {"name": "Jaguar F Pace", "image": "lib/images/car2.png","ratings": "3.5", "engine_type":"Automatic", "price": "400"},
    {"name": "Range Rover Evoque", "image": "lib/images/car3.png","ratings": "3.0", "engine_type":"Disel", "price": "350"},
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: topCars.length,
      shrinkWrap: true, // Ensures it takes only the required space
      physics: const NeverScrollableScrollPhysics(),  // Disables scrolling
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {},
          child: CarCard(
            image: topCars[index]['image']!,
            name: topCars[index]['name']!,
            ratings: topCars[index]["ratings"]!,
            engineType: topCars[index]['engine_type']!,
            price: topCars[index]['price']!
          ),
        );
      },
    );
  }
}