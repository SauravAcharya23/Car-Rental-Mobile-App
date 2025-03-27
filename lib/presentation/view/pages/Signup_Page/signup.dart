import 'package:car_rental_app/core/network/services/auth.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/core/ui/string_constrants.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_social_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpPage extends ConsumerStatefulWidget {
  const SignUpPage({super.key});

  @override
  ConsumerState<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends ConsumerState<SignUpPage> {

  // text editing controllers
  final usernameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();

  final _isLoading = StateProvider.autoDispose<bool>((ref) => false,);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 104),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Image.asset("lib/images/Full Logo.png"),
            
                const Gap(35),
            
                Text(
                  "Create New Account", 
                  style: GoogleFonts.poppins(fontWeight: FontWeight.bold, fontSize: 20.0),
                ),
            
                const Gap(10),
            
                Text(
                  "Set up your username and password.",  
                  style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
                Text(
                  "You can always change it later.",  
                  style: GoogleFonts.poppins(fontSize: 14.0, color: colorLightGrey,),
                  textAlign: TextAlign.center,
                  softWrap: true,
                ),
            
                const Gap(30),
            
                MyTextFormField(
                  controller: usernameController,
                  hintText: "username",
                  prefixIcon: Image.asset("lib/images/user.png"),
                  hideText: false,
                  // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                  fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
                  validate: (val) {
                    if(val!.isEmpty){
                      return "*Name field required";
                    }else{
                      return null;
                    }
                  },
                ),
            
                const Gap(25),
                
                MyTextFormField(
                  controller: emailController,
                  hintText: "Email",
                  prefixIcon: Image.asset("lib/images/Icon.png"),
                  hideText: false,
                  // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                  fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
                  validate: (val) {
                    if(val!.isEmpty){
                      return "*Email field required";
                    }else if (!RegExp(r"^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$").hasMatch(val)) { // Regular Expression for validating email
                      return "Enter a valid email address";
                    } else{
                      return null;
                    }
                  },
                ),
            
                const Gap(25),
            
                MyTextFormField(
                  controller: passwordController,
                  hintText: "Password",
                  prefixIcon: Image.asset("lib/images/lock.png"),
                  suffixIcon: Image.asset("lib/images/eye.png",),
                  hideText: true,
                  // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                  fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
                  validate: (val) {
                    if(val!.isEmpty){
                      return "*Password field required";
                    }else if(val.length < 6){
                      return "Enter a password 6+ chars long";
                    }else{
                      return null;
                    }
                  },
                ),
            
                const Gap(25),
            
                MyTextFormField(
                  controller: confirmPasswordController,
                  hintText: "Confirm Password",
                  prefixIcon: Image.asset("lib/images/lock.png"),
                  suffixIcon: Image.asset("lib/images/eye.png",),
                  hideText: true,
                  // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
                  fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
                  validate: (val) {
                    if(val!.isEmpty){
                      return "*Confirm Password field required";
                    }else if(val != passwordController.text){
                      return "Passwords do not match";
                    }else{
                      return null;
                    }
                  },
                ),
            
                const Gap(25),
            
                ref.watch(_isLoading) == true
                ? CircularProgressIndicator()
                : MyButton(
                  bottonName: "Sign Up",
                  onTap: () async{

                    if(_formKey.currentState != null){
                      if(_formKey.currentState!.validate()){
                        ref.read(_isLoading.notifier).state = true; // Use `read` for updates
                        dynamic result = await _auth.registerAccount(
                          email: emailController.text.trim().toString(), 
                          password: passwordController.text.trim().toString(), 
                          username: usernameController.text.trim().toString()
                        );
              
                        usernameController.clear();
                        emailController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                        ref.read(_isLoading.notifier).state = false; // // Reset the loading state
                        result != null
                        // ignore: use_build_context_synchronously
                        ? SnackBarHelper.showSuccessSnackBar(context,successRegisterMessage)
                        : SnackBarHelper.showErrorSnackBar(context,errorRegisterMessage);
                      }
                    }
                    
                  },
                ),
            
                const Gap(25),
            
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Already have an account? ",  
                      style: GoogleFonts.poppins(fontSize: 14.0,),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.pop(context),
                      child: Text(
                        "Log in",  
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