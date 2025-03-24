

import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FeatureCard extends StatelessWidget {
  final String image;
  final String category;
  final String categoryDetail;
  const FeatureCard({super.key, required this.image, required this.category, required this.categoryDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorWhite,
        // color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: colorBlack.withAlpha((.12 * 255).toInt()),
            blurRadius: 5,
            spreadRadius: 2,
          ),
        ],
      ),
      padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, color: colorLightPurple, scale:1.5,),
          const Gap(20),
          Text(
            category, 
            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 18.0),
          ),
          const Gap(7),
          Text(
            categoryDetail,  
            style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
          ),
        ],
      ),
    );
  }
}