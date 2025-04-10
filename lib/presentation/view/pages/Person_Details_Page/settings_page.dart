import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/profile_components/my_listtile.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

  final settingsList = [
    {"title": "Terms & Conditions", "image": 'lib/images/id3.png', "link": ""},
    {"title": "Notification Settings", "image": 'lib/images/notification.png', "link": ""},
    {"title": "Password Manager", "image": 'lib/images/key.png', "link": Routes.passwordManager},
    {"title": "Delete Account", "image": 'lib/images/bin.png', "link": ""},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Settings",
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: ListView.builder(
          shrinkWrap: true,
          primary: false,
          itemCount: settingsList.length,
          itemBuilder: (context, index) {
            return  GestureDetector(
              onTap: () => Navigator.pushNamed(context, settingsList[index]['link']!),
              child: MyListTile(
                title: settingsList[index]['title']!,
                image: settingsList[index]['image']!,
                onTap: ()  => Navigator.pushNamed(context, settingsList[index]['link']!)
              ),
            );
          },
        )
      ),
    );
  }
}