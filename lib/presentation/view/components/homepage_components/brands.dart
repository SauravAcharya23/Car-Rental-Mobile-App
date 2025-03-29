import 'package:car_rental_app/core/network/services/database.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/model/brand_model/brand_model.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class CarBrandSlider extends StatefulWidget {
  const CarBrandSlider({super.key});

  @override
  State<CarBrandSlider> createState() => _CarBrandSliderState();
}

class _CarBrandSliderState extends State<CarBrandSlider> {

  @override
  Widget build(BuildContext context) {
    // List<Map<String, String>> carBrands = [
    //   {"name": "BMW", "image": "lib/images/bmw.png"},
    //   {"name": "Mercedes", "image": "lib/images/mercedes.png"},
    //   {"name": "Porsche", "image": "lib/images/porsche.png"},
    //   {"name": "BMW", "image": "lib/images/bmw.png"},
    //   {"name": "Mercedes", "image": "lib/images/mercedes.png"},
    //   {"name": "Porsche", "image": "lib/images/porsche.png"},
    // ];

    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 85, // Adjust height as needed
            child: StreamBuilder<List<BrandModel>>(
              stream: DatabaseService().brands,
              builder: (context, snapshot) {
                return snapshot.data == null
                ?  Center(child: CircularProgressIndicator())
                :  ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: snapshot.data?.length,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(right: 10),
                      child: Container(
                        width: 100,
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: colorWhite,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              // color: Colors.black.withOpacity(0.06),
                              color: Colors.black.withAlpha((0.06 * 255).toInt()),
                              blurRadius: 1,
                              spreadRadius: 1,
                            )
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 31,
                              width: 31,
                              child: Image.network(snapshot.data![index].url, fit: BoxFit.cover)
                            ),//Image.asset(carBrands[index]["image"]!,),
                            const Gap(3),
                            Text(checkBrand(snapshot.data![index].name), style: GoogleFonts.poppins(fontSize: 14.0,),), //carBrands[index]["name"]!
                          ],
                        ),
                      ),
                    );
                  },
                );
              }
            ),
          ),
        ),
      ],
    );
  }
}
