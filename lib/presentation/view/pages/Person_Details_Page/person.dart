import 'package:car_rental_app/core/network/services/auth.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/profile_components/my_listtile.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonDetailsPage extends StatefulWidget {
  const PersonDetailsPage({super.key});

  @override
  State<PersonDetailsPage> createState() => _PersonDetailsPageState();
}

class _PersonDetailsPageState extends State<PersonDetailsPage> {

  final AuthService _auth = AuthService();

  final listTile = [
    {"title": "My Profile", "image": 'lib/images/person.png', "link": ""},
    {"title": "Payment Method", "image": 'lib/images/cards.png', "link": Routes.cards},
    {"title": "My Bookings", "image": 'lib/images/booking.png', "link": ""},
    {"title": "My Wallet", "image": 'lib/images/wallet.png', "link": ""},
    {"title": "Settings", "image": 'lib/images/setting.png', "link": Routes.settings},
    {"title": "Help Center", "image": 'lib/images/question.png', "link": ""},
    {"title": "Privacy Policy", "image": 'lib/images/privacy-policy.png', "link": ""},
    {"title": "Log Out", "image": 'lib/images/logout.png', "link": ""},
  ];

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
            children: [
              Row(
                // mainAxisAlignment: MainAxisAlignment.start,
                // crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  LayoutBuilder(
                    builder: (context, constraints) {
                      double size = MediaQuery.of(context).size.width * 0.15; // 40% of screen width
                      return Container(
                        margin: const EdgeInsets.only(top: 8, bottom: 8, right: 16),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16), // Rounded corners
                          color: Colors.amber,
                          boxShadow: [
                            BoxShadow(
                              // color: Colors.black.withOpacity(0.1),
                              color: Colors.black.withAlpha((0.1 * 255).toInt()),
                              blurRadius: 6,
                              spreadRadius: 2,
                              offset: const Offset(0, 4),
                            ),
                          ],
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16), // Ensuring image follows rounded corners
                          child: Image.asset(
                            'lib/images/man.jpg', // Change this dynamically if needed
                            height: size,// MediaQuery.of(context).size.height * 0.07, // 25% of screen height
                            width: size, // MediaQuery.of(context).size.width * 0.16, // 40% of screen width
                            fit: BoxFit.cover, // Cover the entire container
                          ),
                        ),
                      );
                    }
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "William Mike", 
                        style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
                      ),
                      GestureDetector(
                        onTap: () => Navigator.pushNamed(context, Routes.editProfile),
                        child: Text('Edit Profile', style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightBlue),)
                      ),
                    ],
                  )
                ],
              ),

              Divider(
                // color: colorVeryLightGrey.withOpacity(.6),
                color: colorVeryLightGrey.withAlpha((0.6 * 255).toInt()),
                thickness: 1.2,
              ),

              const Gap(15),

              // const DocumentsCard(),

              // const Gap(15),

              ListView.builder(
                itemCount: listTile.length,
                shrinkWrap: true,
                primary: false,
                padding: EdgeInsets.zero,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () => listTile[index]['title'] == "Log Out" ? _auth.logout()  :Navigator.pushNamed(context, listTile[index]['link']!),
                    child: MyListTile(
                      title: listTile[index]['title']!,
                      image: listTile[index]['image']!,
                      onTap: () => listTile[index]['title'] == "Log Out" ? _auth.logout()  :Navigator.pushNamed(context, listTile[index]['link']!)
                    ),
                  );
                },
              ),

            ],
          ),
        ),
      )
    );
  }
}