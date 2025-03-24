import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class DocumentsCard extends StatefulWidget {
  const DocumentsCard({super.key});

  @override
  State<DocumentsCard> createState() => _DocumentsCardState();
}

class _DocumentsCardState extends State<DocumentsCard> {

  List<Map<String, String>> documents = [
    {"name": "License", "image": "lib/images/id1.png", "link":''},
    {"name": "Passport", "image": "lib/images/id2.png", "link":''},
    {"name": "Contract", "image": "lib/images/id3.png", "link":''},
    {"name": "Cards", "image": "lib/images/cards.png", "link":Routes.cards},
  ];


  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 85, // Adjust height as needed
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: documents.length,
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 15),
                  child: GestureDetector(
                    onTap: () => Navigator.pushNamed(context, documents[index]['link']!),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.25, // 25% of screen width 100,
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
                          Image.asset(documents[index]["image"]!,color: colorLightBlue,),
                          const Gap(5),
                          Text(documents[index]["name"]!, style: GoogleFonts.poppins(fontSize: 14.0,),),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}