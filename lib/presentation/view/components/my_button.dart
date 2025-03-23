import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyButton extends StatelessWidget {
  final String bottonName;
  final Widget? bottonIcon;
  final Function()? onTap;
  const MyButton({super.key, required this.bottonName, required this.onTap, this.bottonIcon});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 17),
        // height: 50,
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [colorPurple, colorBlue],// Adjust colors as needed
            begin: Alignment.topLeft,
            end: Alignment.bottomRight
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: bottonIcon ?? Text(
            bottonName,
            style: GoogleFonts.poppins(fontSize: 16.0,color: colorWhite),
          ),
        ),
      ),
    );
  }
}