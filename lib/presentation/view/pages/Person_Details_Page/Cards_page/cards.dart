import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Card(s)",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0, color: colorBlack),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: colorVeryLightGrey.withOpacity(.02),
        backgroundColor: colorVeryLightGrey.withAlpha((0.02 * 255).toInt()),
        leading:  IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_rounded, size: 35, color: Colors.black,), // Custom back button icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        actions: [
          Icon(Icons.add, size: 30,),
          const Gap(20),
        ],
      ),

      body: ListView.builder(
        itemCount: 8,
        shrinkWrap: true,
        primary: false,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60,,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 20.0), // Adjust spacing as needed,
            child: Container(
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [colorPurple, colorBlue],// Adjust colors as needed
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Card(
                color: Colors.transparent, // Make card transparent
                clipBehavior: Clip.hardEdge,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Visa Card",  
                        style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                      ),
                      const Gap(4),
                      Text(
                        "•••• •••• •••• 2847",  
                        style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.bold, color: colorWhite),
                      ),
                      const Gap(10),
                      Text(
                        "Card Name",  
                        style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                      ),
                      const Gap(4),
                      Text(
                        "Mike Smith",  
                        style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.bold, color: colorWhite),
                      ),
                      const Gap(10),
                      Text(
                        "Expires Date",  
                        style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                      ),
                      const Gap(4),
                      Text(
                        "04/30",  
                        style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.bold, color: colorWhite),
                      ),
                      const Gap(10),
                      Image.asset("lib/images/chip.png",)
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}