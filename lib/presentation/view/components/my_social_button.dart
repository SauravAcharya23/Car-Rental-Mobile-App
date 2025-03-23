import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MySocialButton extends StatelessWidget {

  final Widget imageIcon;
  final String imagename;
  const MySocialButton({super.key, required this.imageIcon, required this.imagename});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Container(
        // padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
        height: 55,
        // width: 130,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.0), 
          // color: colorVeryLightGrey.withOpacity(.2),
          color: colorVeryLightGrey.withAlpha((0.2 * 255).toInt()),
          // color: Colors.amber,
          border: Border.all(
            // color: colorVeryLightGrey.withOpacity(.02),
            color: colorVeryLightGrey.withAlpha((0.02 * 255).toInt()),
            width: 2.0
          )
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            imageIcon,
            Text(imagename,style: GoogleFonts.poppins(fontSize: 16.0),)
          ],
        ),
      ),
    );
  }
}