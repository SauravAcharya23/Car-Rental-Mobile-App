

import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_social_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 104),
          child: Column(
            children: [
              Image.asset("lib/images/Full Logo.png"),

              const Gap(35),

              Text(
                "Welcome Back", 
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
              ),

              const Gap(10),

              Text(
                "Log in to your account using email or social networks",  
                style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                textAlign: TextAlign.center,
                softWrap: true,
              ),

              const Gap(30),
              
              MyTextFormField(
                hintText: "Email",
                prefixIcon: Image.asset("lib/images/Icon.png"),
                hideText: false,
              ),

              const Gap(25),

              MyTextFormField(
                hintText: "Password",
                prefixIcon: Image.asset("lib/images/lock.png"),
                suffixIcon: Image.asset("lib/images/eye.png",),
                hideText: true,
              ),

              const Gap(15),

              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",  
                  style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightBlue),
                ),
              ),

              const Gap(25),

              MyButton(
                bottonName: "Log In",
                onTap: () {
                  
                },
              ),

              const Gap(25),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "First time here? ",  
                    style: GoogleFonts.poppins(fontSize: 14.0,),
                  ),
                  Text(
                    "Sign up",  
                    style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightBlue),
                  ),
                ],
              ),

              const Gap(25),

              Row(
                children: [
                  Expanded(
                    child: Divider(
                      color: colorVeryLightGrey.withOpacity(.6),
                      thickness: 1,
                      endIndent: 7.0,
                    ),
                  ),
                  Text(
                    "Or sign in with",  
                    style: GoogleFonts.poppins(fontSize: 14.0,),
                  ),
                  Expanded(
                    child: Divider(
                      color: colorVeryLightGrey.withOpacity(.6),
                      thickness: 1,
                      indent: 7.0,
                    ),
                  ),
                ],
              ),

              const Gap(20),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  MySocialButton(
                    imageIcon: Image.asset("lib/images/google.png"),
                    imagename: "Google",
                  ),

                  const Gap(20),

                  MySocialButton(
                    imageIcon: Image.asset("lib/images/facebook.png"),
                    imagename: "Facebook",
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}