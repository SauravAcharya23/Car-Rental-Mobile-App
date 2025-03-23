import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/filter_components/my_wrap_container.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_xlider/flutter_xlider.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterPage extends StatefulWidget {
  const FilterPage({super.key});

  @override
  State<FilterPage> createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {

  double lowerValue = 500.0;
  double upperValue = 1500.0;
  List<String> types = ["Economy", "Compact", "SUV", "Luxury", "Sedan"];
  String selectedType = "Economy"; // Default selected type
  List<String> character = [ "Air-conditioning","Automatic", "Manual",];
  String selectedCharacter = "Air-conditioning"; // Default selected type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorVeryLightGrey.withOpacity(.15),
      appBar: AppBar(
        title: Text(
          "Filter",
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
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "All Cars", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),

              FlutterSlider(
                values: [lowerValue,upperValue],
                max: 2500,
                min: 100,
                rangeSlider: true,
                tooltip: FlutterSliderTooltip(
                  alwaysShowTooltip: true,
                  positionOffset: FlutterSliderTooltipPositionOffset(
                    top: 57
                  ),
                  // direction: FlutterSliderTooltipDirection.top
                  // custom: (value) {
                  //   return Text(value.toString()+'\$');
                  // },
                  // format: (String value) {
                  //   return '\$$value' ;
                  // }
                  leftPrefix:  Text('\$', style: GoogleFonts.poppins(fontSize: 12.0,color: colorWhite),),
                  rightPrefix:  Text('\$', style: GoogleFonts.poppins(fontSize: 12.0,color: colorWhite),),
                  boxStyle: FlutterSliderTooltipBox(
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [colorPurple, colorBlue],// Adjust colors as needed
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight
                      ),
                      borderRadius: BorderRadius.circular(8)
                    )
                  ),
                  textStyle: GoogleFonts.poppins(fontSize: 12.0,color: colorWhite),
                ),
                onDragging: (handlerIndex, lowerValue, upperValue) {
                  lowerValue = lowerValue;
                  upperValue = upperValue;
                },
              ),

              const Gap(40),

              Text(
                "Types", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),

              const Gap(15),

              Wrap(
                spacing: 10, // Horizontal spacing
                runSpacing: 14, // Vertical spacing
                children: types.map(
                  (type) {
                    bool isSelected = selectedType == type;
                    return MyWrapContainer(
                      type: type,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedType = type;
                        });
                      },
                    );
                  } 
                ).toList(),
              ),

              const Gap(20),

              Text(
                "Vehicle Characteristics", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),

              const Gap(15),

              Wrap(
                spacing: 10, // Horizontal spacing
                runSpacing: 14, // Vertical spacing
                children: character.map(
                  (character) {
                    bool isSelected = selectedCharacter == character;
                    return MyWrapContainer(
                      type: character,
                      isSelected: isSelected,
                      onTap: () {
                        setState(() {
                          selectedCharacter = character;
                        });
                      },
                    );
                  } 
                ).toList(),
              ),

              const Gap(40),

              MyButton(
                bottonName: "Show 20 Results", 
                onTap: () {
                  
                },
              ),

              const Gap(20),
            ],
          ),
        ),
      )
    );
  }
}