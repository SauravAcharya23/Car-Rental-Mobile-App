import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AppDrawer extends StatelessWidget {
  const AppDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        // padding: EdgeInsets.zero,
        children: [
          // DrawerHeader(
          //   // decoration: BoxDecoration(),
          //   child: Text("Components Menu", style: GoogleFonts.poppins(fontSize: 18.0,),),
          // ),
          Container(
            padding: EdgeInsets.all(16),
            color: colorBlue,
            alignment: Alignment.centerLeft,
            child: Text(
              "Components Menu",
              style: TextStyle(color: colorWhite, fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ),
          ListTile(
            title: Text("Add Brand", style: GoogleFonts.poppins(fontSize: 16, fontWeight: FontWeight.bold),),
            onTap: () {
              Navigator.pushNamed(context, Routes.addBrand);
            },
          ),
          ListTile(
            leading: Icon(Icons.person),
            title: Text("Profile"),
            onTap: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage()));
            },
          ),
          ListTile(
            leading: Icon(Icons.settings),
            title: Text("Settings"),
            onTap: () {
              // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SettingsPage()));
            },
          ),
        ],
      ),
    );
  }
}