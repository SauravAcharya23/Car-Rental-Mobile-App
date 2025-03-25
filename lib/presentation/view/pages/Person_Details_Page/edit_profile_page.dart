import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  final nameController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();
  final dOBController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "My Profile",
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
        padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Stack(
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('lib/images/man.jpg',),
                    radius: 50,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: CircleAvatar(
                      backgroundColor: colorVeryLightGrey,
                      radius: 13,
                      child: Center(
                        child: Icon(Icons.edit, size: 17,color: colorLightPurple,),
                      ),
                    )
                  )
                ],
              ),
            ),

            const Gap(20),
            MyTextFormField(
              controller: nameController,
              hintText: "username",
              prefixIcon: Image.asset("lib/images/user.png"),
              hideText: false,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
            ),
            const Gap(15),
            MyTextFormField(
              controller: phoneNumberController,
              hintText: "phone number",
              prefixIcon: Image.asset("lib/images/iphone.png"),
              hideText: false,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
              keyboardtype: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(10),
              ],
            ),
            const Gap(15),
            MyTextFormField(
              controller: emailController,
              hintText: "Email",
              prefixIcon: Image.asset("lib/images/Icon.png"),
              hideText: false,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
              readOnly: true,
            ),
            const Gap(15),
            MyTextFormField(
              controller: dOBController,
              hintText: "Date of birth",
              prefixIcon: Image.asset("lib/images/calendar.png"),
              hideText: false,
              // fillcolor: colorLightGrey.withOpacity(0.05), // 5% opacity,
              fillcolor: colorLightGrey.withAlpha((0.05 * 255).toInt()),
              onTap: () async {
                DateTime? date = DateTime(1900);
                FocusScope.of(context).requestFocus(FocusNode());
                date = await showDatePicker(
                  context: context, 
                  initialDate:DateTime.now(),
                  firstDate:DateTime(1900),
                  lastDate: DateTime(2100)
                );
                dOBController.text = "${date!.year}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}";
              },
            ),
            const Gap(45),

            MyButton(
              bottonName: "Update Profile", 
              onTap: (){}
            )

          ],
        ),
      ),
    );
  }
}