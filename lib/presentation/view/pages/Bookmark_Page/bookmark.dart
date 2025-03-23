import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/presentation/view/components/homepage_components/car_card.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookmarkPage extends StatefulWidget {
  const BookmarkPage({super.key});

  @override
  State<BookmarkPage> createState() => _BookmarkPageState();
}

class _BookmarkPageState extends State<BookmarkPage> {

  List<Map<String, String>> bookmark = [
    {"name": "Maserati 867", "image": "lib/images/car1.png","ratings": "4.5", "engine_type":"Petrol","price": "540"},
    {"name": "Jaguar F Pace", "image": "lib/images/car2.png","ratings": "3.5", "engine_type":"Automatic", "price": "400"},
    {"name": "Range Rover Evoque", "image": "lib/images/car3.png","ratings": "3.0", "engine_type":"Disel", "price": "350"},
    {"name": "Maserati 867", "image": "lib/images/car1.png","ratings": "4.5", "engine_type":"Petrol","price": "540"},
    {"name": "Jaguar F Pace", "image": "lib/images/car2.png","ratings": "3.5", "engine_type":"Automatic", "price": "400"},
    {"name": "Range Rover Evoque", "image": "lib/images/car3.png","ratings": "3.0", "engine_type":"Disel", "price": "350"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: colorVeryLightGrey.withOpacity(.15),
      backgroundColor: colorVeryLightGrey.withAlpha((0.15 * 255).toInt()),
      appBar: AppBar(
        title: Text(
          "Bookmark(s)",
          style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0, color: colorBlack),
        ),
        centerTitle: true,
        elevation: 0,
        // backgroundColor: colorVeryLightGrey.withOpacity(.02),
        backgroundColor: colorVeryLightGrey.withAlpha((0.02 * 255).toInt()),
      ),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: bookmark.length,
            shrinkWrap: true, // Ensures it takes only the required space
            physics: const BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return CarCard(
                image: bookmark[index]['image']!,
                name: bookmark[index]['name']!,
                ratings: bookmark[index]["ratings"]!,
                engineType: bookmark[index]['engine_type']!,
                price: bookmark[index]['price']!
              );
            },
          ),

          Positioned.fill(
            child: IgnorePointer(
              ignoring: true,
              child: Column(
                children: [
                  buildFadeEffect(top: true),
                  const Spacer(),
                  buildFadeEffect(top: false),
                ],
              ),
            ),
          ),
        ],
      )
    );
  }
}