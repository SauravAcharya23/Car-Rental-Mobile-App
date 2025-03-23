import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyWrapContainer extends StatelessWidget {
  final String type;
  final bool isSelected;
  final Function() onTap;
  const MyWrapContainer({super.key, required this.type, required this.isSelected, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
        decoration: BoxDecoration(
          // color: isSelected ? Colors.blue : Colors.grey[200],
          gradient: LinearGradient(
            colors: isSelected 
            ? [colorPurple, colorBlue] 
            // : [colorLightGrey.withOpacity(.08), colorLightGrey.withOpacity(.08)],// Adjust colors as needed
            : [colorLightGrey.withAlpha((0.08 * 255).toInt()),colorLightGrey.withAlpha((0.08 * 255).toInt())],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Text(
          type,
          style: GoogleFonts.poppins(fontSize: 16.0,color: isSelected ? colorWhite : colorBlack),
        ),
      ),
    );
  }
}