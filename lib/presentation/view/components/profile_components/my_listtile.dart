import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyListTile extends StatelessWidget {
  
  final String title;
  final Function() onTap;
  final String image;

  const MyListTile({super.key, required this.title, required this.onTap, required this.image});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      title: Text(title, style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.w600),),
      trailing: GestureDetector(
        onTap: onTap,
        child: const Icon(Icons.keyboard_arrow_right_rounded, size: 30, color: colorLightGrey)
      ),
      leading: CircleAvatar(
        // backgroundColor: colorLightGrey.withOpacity(.13),
        backgroundColor: colorLightGrey.withAlpha((0.13 * 255).toInt()),
        // backgroundImage:  const AssetImage('lib/images/person.png'),
        radius: 18,
        child: ClipOval(
          child: ImageFiltered(
            imageFilter: const ColorFilter.mode(
              colorLightBlue, // Change the tint color
              BlendMode.srcATop, // Blending mode for tint effect
            ),
            child: Image.asset(image, fit: BoxFit.contain,width: 20,),
          ),
        ),
      ),
    );
  }
}