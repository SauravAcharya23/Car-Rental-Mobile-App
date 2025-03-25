import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordManagerPage extends StatefulWidget {
  const PasswordManagerPage({super.key});

  @override
  State<PasswordManagerPage> createState() => _PasswordManagerPageState();
}

class _PasswordManagerPageState extends State<PasswordManagerPage> {

  final oldPasswordController = TextEditingController();
  final newPasswordController = TextEditingController();
  final confirmNewPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Password Manager",
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
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 7),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Current Password', style: GoogleFonts.poppins(fontSize: 14.0),),
            const Gap(5),
            MyTextFormField(
              controller: oldPasswordController,
              hintText: "Current Password",
              prefixIcon: Image.asset("lib/images/lock.png"),
              suffixIcon: Image.asset("lib/images/eye.png",),
              hideText: true,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
            ),
            const Gap(15),
            Text('New Password', style: GoogleFonts.poppins(fontSize: 14.0),),
            const Gap(5),
            MyTextFormField(
              controller: newPasswordController,
              hintText: "New Password",
              prefixIcon: Image.asset("lib/images/lock.png"),
              suffixIcon: Image.asset("lib/images/eye.png",),
              hideText: true,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
            ),
            const Gap(15),
            Text('Confirm New Password', style: GoogleFonts.poppins(fontSize: 14.0),),
            const Gap(5),
            MyTextFormField(
              controller: confirmNewPasswordController,
              hintText: "Confirm New Password",
              prefixIcon: Image.asset("lib/images/lock.png"),
              suffixIcon: Image.asset("lib/images/eye.png",),
              hideText: true,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
            ),
            const Gap(50),
            MyButton(
              bottonName: "Change Password", 
              onTap: (){}
            )
          ],
        ),
      ),
    );
  }
}