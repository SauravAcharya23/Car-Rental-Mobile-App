import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

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
        return Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              margin: const EdgeInsets.only(bottom: 25),  // Space between containers
              width: double.infinity,
              decoration: BoxDecoration(
                color: colorWhite,
                borderRadius: BorderRadius.circular(15.0)
              ),
              child: Column(
                children: [
                  Image.asset(topCars[index]['image']!),

                  const Gap(10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          topCars[index]['name']!, 
                          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14.0),
                        ),
                        Row(
                          children: [
                            Image.asset('lib/images/star-filled.png'),
                            Text(topCars[index]["ratings"]!, style: GoogleFonts.poppins(fontSize: 14.0,),),
                          ],
                        )
                      ],
                    ),
                  ),

                  const Gap(10),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(topCars[index]['engine_type']!, style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightGrey),),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: "\$${topCars[index]['price']}",  // Price
                                style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightBlue, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: "/day",  // "day" with different color
                                style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightGrey,),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  )

                ],
              ),
            ),

            Positioned(
              top: 0,
              right: 0,
              child: Padding(
                padding: const EdgeInsets.only(right: 8.0,top: 6.0),
                child: CircleAvatar(
                  backgroundColor: colorVeryLightGrey.withOpacity(.2),
                  maxRadius: 15.0,
                  child: CircleAvatar(
                    maxRadius: 8.0,
                    backgroundImage: const AssetImage('lib/images/Shape.png'),
                    backgroundColor: colorVeryLightGrey.withOpacity(.1),
                  ),
                ),
              )
            )
          ],
        );
      },
    );
  }
}