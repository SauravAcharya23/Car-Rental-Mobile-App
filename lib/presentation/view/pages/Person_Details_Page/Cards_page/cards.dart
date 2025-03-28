import 'package:car_rental_app/core/network/services/database.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/model/card_model/Card_model.dart';
import 'package:car_rental_app/model/user/user_model.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CardsPage extends StatefulWidget {
  const CardsPage({super.key});

  @override
  State<CardsPage> createState() => _CardsPageState();
}

class _CardsPageState extends State<CardsPage> {
  @override
  Widget build(BuildContext context) {
    // Get the user object from the Provider safely.
    final user = context.watch<UserModel?>();

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
          GestureDetector(
            onTap: () => Navigator.pushNamed(context, Routes.addCard),
            child: Icon(Icons.add, size: 30,)
          ),
          const Gap(20),
        ],
      ),

      body: StreamBuilder<List<CardModel>>(
        stream: DatabaseService(uid: user?.uid).cards,
        builder: (context, snapshot) {
          if(snapshot.data == null){
            return Center(child: CircularProgressIndicator());
          }else{
            return snapshot.data!.isEmpty//snapshot.data == null
            ? Center(child: Text("No cards added",style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),))
            : ListView.builder(
              itemCount: snapshot.data?.length,
              shrinkWrap: true,
              primary: false,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60,,
              itemBuilder: (context, index) {
                return creditCardWidget(
                  cardNumber: snapshot.data![index].cardNumber, 
                  expiryDate: snapshot.data![index].expiryDate, 
                  cardHolderName: snapshot.data![index].cardName, 
                  cvvCode: snapshot.data![index].cvv,
                  enableFloatingCard: false,
                  colors: [
                    colorPurple,
                    colorBlue
                  ]
                );
                
              },
            );
          }
          
        }
      ),
    );
  }
}



// Padding(
              //   padding: const EdgeInsets.only(bottom: 20.0), // Adjust spacing as needed,
              //   child: Container(
              //     decoration: BoxDecoration(
              //       gradient: const LinearGradient(
              //         colors: [colorPurple, colorBlue],// Adjust colors as needed
              //         begin: Alignment.topLeft,
              //         end: Alignment.bottomRight
              //       ),
              //       borderRadius: BorderRadius.circular(10.0),
              //     ),
              //     child: Card(
              //       color: Colors.transparent, // Make card transparent
              //       clipBehavior: Clip.hardEdge,
              //       child: Padding(
              //         padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               "Visa Card",  
              //               style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
              //             ),
              //             const Gap(4),
              //             Text(
              //               "•••• •••• •••• 2847",  
              //               style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.bold, color: colorWhite),
              //             ),
              //             const Gap(10),
              //             Text(
              //               "Card Name",  
              //               style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
              //             ),
              //             const Gap(4),
              //             Text(
              //               "Mike Smith",  
              //               style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.bold, color: colorWhite),
              //             ),
              //             const Gap(10),
              //             Text(
              //               "Expires Date",  
              //               style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
              //             ),
              //             const Gap(4),
              //             Text(
              //               "04/30",  
              //               style: GoogleFonts.poppins(fontSize: 14.0,fontWeight: FontWeight.bold, color: colorWhite),
              //             ),
              //             const Gap(10),
              //             Image.asset("lib/images/chip.png",)
              //           ],
              //         ),
              //       ),
              //     ),
              //   ),
              // );