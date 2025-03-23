import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';


Widget buildFadeEffect({required bool top}) {
  return Container(
    height: 30, // Adjust the height for the fading effect
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: top ? Alignment.topCenter : Alignment.bottomCenter,
        end: top ? Alignment.bottomCenter : Alignment.topCenter,
        colors: [
          // Colors.white.withOpacity(0.9),
          // Colors.white.withOpacity(0),
          colorWhite.withAlpha((0.9 * 255).toInt()),
          colorWhite.withAlpha((0 * 255).toInt()),
        ],
      ),
    ),
  );
}