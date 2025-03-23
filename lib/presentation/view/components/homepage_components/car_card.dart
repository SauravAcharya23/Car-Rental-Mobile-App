import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';


class CarCard extends StatefulWidget {

  final String image;
  final String name;
  final String ratings;
  final String engineType;
  final String price;

  const CarCard({
    super.key,
    required this.image,
    required this.name,
    required this.ratings,
    required this.engineType,
    required this.price
  });

  @override
  State<CarCard> createState() => _CarCardState();
}

class _CarCardState extends State<CarCard> {
  @override
  Widget build(BuildContext context) {
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
              Image.asset(widget.image),
              const Gap(10),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.name, 
                      style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 14.0),
                    ),
                    Row(
                      children: [
                        Image.asset('lib/images/star-filled.png'),
                        Text(widget.ratings, style: GoogleFonts.poppins(fontSize: 14.0,),),
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
                    Text(widget.engineType, style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightGrey),),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$${widget.price}",  // Price
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
              // backgroundColor: colorVeryLightGrey.withOpacity(.2),
              backgroundColor: colorVeryLightGrey.withAlpha((0.2 * 255).toInt()),
              maxRadius: 15.0,
              child: CircleAvatar(
                maxRadius: 8.0,
                backgroundImage: const AssetImage('lib/images/Shape.png'),
                // backgroundColor: colorVeryLightGrey.withOpacity(.1),
                backgroundColor: colorVeryLightGrey.withAlpha((0.1 * 255).toInt()),
              ),
            ),
          )
        )
      ],
    );
  }
}