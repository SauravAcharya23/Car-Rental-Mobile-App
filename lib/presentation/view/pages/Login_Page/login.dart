

import 'package:car_rental_app/core/network/services/auth.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/core/ui/string_constrants.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_social_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:car_rental_app/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginPage extends ConsumerStatefulWidget {
  const LoginPage({super.key});

  @override
  ConsumerState<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends ConsumerState<LoginPage> {

  // text editing controllers
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _hidePassword = StateProvider.autoDispose<bool>((ref) => true,);
  final _isLoading = StateProvider.autoDispose<bool>((ref) => false,);

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 104),
          child: Form(
            key: _formKey,
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
                  controller: emailController,
                  // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                  fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
                  validate: (val) {
                    if(val!.isEmpty){
                      return "*Email field required";
                    }else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(val)) { // Regular Expression for validating email
                      return "Enter a valid email address";
                    }else{
                      return null;
                    }
                  },
                ),
            
                const Gap(25),
            
                MyTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: Image.asset("lib/images/lock.png"),
                  suffixIcon: GestureDetector(
                    onTap: (){
                      ref.read(_hidePassword.notifier).update((state) => !state);// // Reset the loading state
                    },
                    child:Image.asset(ref.watch(_hidePassword) ? "lib/images/eye.png" : "lib/images/view.png",)
                    
                  ),
                  hideText: ref.watch(_hidePassword),
                  // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                  fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
                  validate: (val) {
                    if(val!.isEmpty){
                      return "*Password field required";
                    }else{
                      return null;
                    }
                  },
                ),
            
                const Gap(15),
            
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, Routes.forgotPassword),
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Text(
                      "Forgot Password?",  
                      style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightBlue),
                    ),
                  ),
                ),
            
                const Gap(25),
            
                ref.watch(_isLoading) == true
                ? CircularProgressIndicator()
                : MyButton(
                  bottonName: "Log In",
                  onTap: ()async {
                    if(_formKey.currentState != null){
                      if(_formKey.currentState!.validate()){
                        ref.read(_isLoading.notifier).state = true; // Use `read` for updates

                        dynamic result = await _auth.loginAccount(email: emailController.text.trim().toString(), password: passwordController.text.trim().toString());

                        if(result == null){
                          SnackBarHelper.showErrorSnackBar(context,errorLogin);
                          ref.read(_isLoading.notifier).state = false; // Reset the loading state
                        }
                      }
                    }
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
                    GestureDetector(
                      onTap: ()  => Navigator.pushNamed(context, Routes.signup),
                      child: Text(
                        "Sign up",  
                        style: GoogleFonts.poppins(fontSize: 14.0,color: colorLightBlue),
                      ),
                    ),
                  ],
                ),
            
                const Gap(25),
            
                Row(
                  children: [
                    Expanded(
                      child: Divider(
                        // color: colorVeryLightGrey.withOpacity(.6),
                        color: colorVeryLightGrey.withAlpha((0.6 * 255).toInt()),
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
                        // color: colorVeryLightGrey.withOpacity(.6),
                        color: colorVeryLightGrey.withAlpha((0.6 * 255).toInt()),
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
      ),
    );
  }
}