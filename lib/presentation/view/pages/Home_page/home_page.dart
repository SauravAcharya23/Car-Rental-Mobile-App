import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/homepage_components/brands.dart';
import 'package:car_rental_app/presentation/view/components/homepage_components/top_cars.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorVeryLightGrey.withOpacity(.15),
      backgroundColor: colorVeryLightGrey.withAlpha((0.15 * 255).toInt()),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 60),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(13), // Adjust padding for spacing
                        decoration: BoxDecoration(
                          color: colorWhite, // Set background color if needed
                          borderRadius: BorderRadius.circular(12), // Adjust border radius as needed
                        ),
                        clipBehavior: Clip.antiAlias, // Ensures the child respects the border radius
                        child: Image.asset('lib/images/location.png'),
                      ),
                      const Gap(15),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Your location",  
                            style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                          ),
                          Text(
                            "Norvey, USA", 
                            style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const CircleAvatar(
                    backgroundImage: AssetImage('lib/images/man.jpg'),
                    // backgroundColor: Colors.amber,
                  )
                ],
              ),

              const Gap(30),

              Text(
                "Select or search your", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),
              Text(
                "Favourite vehicle", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0, color: colorLightPurple),
              ),

              const Gap(20),

              Row(
                children: [
                  Flexible(
                    flex: 5,
                    child: MyTextFormField(
                      hintText: 'Search', 
                      hideText: false, 
                      controller: searchController,
                      prefixIcon: Image.asset('lib/images/search.png'),
                      fillcolor: colorWhite,
                      validate: (val) {
                        if(val!.isEmpty){
                          return "*Search field required";
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                  const Gap(15),
                  Flexible(
                    child: MyButton(
                      bottonName: 'filter', 
                      bottonIcon: Image.asset('lib/images/filter.png'),
                      onTap: () => Navigator.pushNamed(context, Routes.filter),
                    ),
                  )
                ],
              ),

              const Gap(30),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Brands", 
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text('View All', style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightBlue),),
                ],
              ),
              const Gap(10),
              
              const CarBrandSlider(),

              const Gap(30),
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Top Cars", 
                    style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
                  ),
                  Text('View All', style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightBlue),),
                ],
              ),

              const TopCars()
              
            ],
          ),
        ),
      )
    );
  }
}