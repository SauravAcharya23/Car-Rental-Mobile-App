import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class ForgotPasswordpage extends StatefulWidget {
  const ForgotPasswordpage({super.key});

  @override
  State<ForgotPasswordpage> createState() => _ForgotPasswordpageState();
}

class _ForgotPasswordpageState extends State<ForgotPasswordpage> {

  // text editing controllers
  final emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: colorVeryLightGrey.withOpacity(.02),
        backgroundColor: colorVeryLightGrey.withAlpha((0.02 * 255).toInt()),
        elevation: 0,
        leading:  IconButton(
          icon: const Icon(Icons.keyboard_arrow_left_rounded, size: 35, color: Colors.black,), // Custom back button icon
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 14),
          child: Column(
            children: [
              Text(
                "Forgot Password", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),

              const Gap(10),

              Text(
                "Please enter your email address. So we'll send you link to get back in to your account.",  
                style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                textAlign: TextAlign.center,
                softWrap: true,
              ),

               const Gap(35),
              
              MyTextFormField(
                controller: emailController,
                hintText: "Email",
                prefixIcon: Image.asset("lib/images/Icon.png"),
                hideText: false,
                // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
              ),

              const Gap(25),

              MyButton(
                bottonName: "Send Code",
                onTap: () {
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}