import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/car_details_components/feature_card.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gap/gap.dart';

class CarDetailsPage extends StatefulWidget {
  const CarDetailsPage({super.key});

  @override
  State<CarDetailsPage> createState() => _CarDetailsPageState();
}

class _CarDetailsPageState extends State<CarDetailsPage> {

  List<ImageProvider> imageList = <ImageProvider>[];
  bool imagePrecached = false;
  final List<Map<String, String>> features = [
    {
      'image': 'lib/images/gear.png',
      'category': 'Transmission',
      'categoryDetail': 'Automatic',
    },
    {
      'image': 'lib/images/car-seat.png',
      'category': 'Doors & Seats',
      'categoryDetail': '2 Doors & 2 Seats',
    },
    {
      'image': 'lib/images/fan.png',
      'category': 'Air Condition',
      'categoryDetail': 'Climate Control',
    },
    {
      'image': 'lib/images/bio-fuel.png',
      'category': 'Fuel Type',
      'categoryDetail': 'Petrol',
    },
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Bugatti Vision",
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
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 200,
              child: Transform.scale(
                 scale: 1.5, // Increase this value for more zoom
                child: Flutter3DViewer(
                  src: 'lib/images/3d/bugatti_vision_gt.glb',
                  activeGestureInterceptor: true,
                  // progressBarColor: Colors.amber,
                  enableTouch: true,
                ),
              )
              
            ),
            const Gap(5),
            Text(
              "All Features", 
              style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
            ),

            const Gap(15),
            Wrap(
              spacing: 10, // Horizontal spacing
              runSpacing: 10, // Vertical spacing
              alignment: WrapAlignment.start,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 25, // Half of the screen width minus padding
                  child: FeatureCard(
                    image: 'lib/images/gear.png',
                    category: "Transmission",
                    categoryDetail: "Automatic",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  child: FeatureCard(
                    image: 'lib/images/car-seat.png',
                    category: "Doors & Seats",
                    categoryDetail: "2 Doors & 2 Seats",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  child: FeatureCard(
                    image: 'lib/images/fan.png',
                    category: "Air Condition",
                    categoryDetail: "Climate Control",
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 2 - 25,
                  child: FeatureCard(
                    image: 'lib/images/bio-fuel.png',
                    category: "Fuel Type",
                    categoryDetail: "Petrol",
                  ),
                ),
              ],
            ),

            const Gap(40),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Text(
                      "Total Price",  
                      style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                    ),
                    Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: "\$1200",  // Price
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
                const Gap(100),
                Expanded(
                  child: MyButton(
                    bottonName: "Book Now", 
                    onTap: (){}
                  ),
                )
              ],
            ),

            const Gap(25)
          ],
        )
      ),
    );
    
  }
}

