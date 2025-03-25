import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:car_rental_app/presentation/view/components/profile_components/Card_component/input_text_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';

class AddCard extends StatefulWidget {
  const AddCard({super.key});

  @override
  State<AddCard> createState() => _AddCardState();
}

class _AddCardState extends State<AddCard> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _yearMonthController = TextEditingController();
  final TextEditingController _CSVController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add New Card",
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
          // 
          Image.asset('lib/images/focus.png'),
          const Gap(20),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10), //vertical: 60,
        child: Column(
          children: [
            // For Card number
            MyTextFormField(
              hintText: "XXXX XXXX XXXX XXXX", 
              hideText: false , 
              controller: _controller, 
              fillcolor: colorLightGrey.withAlpha((0.09 * 255).toInt()),
              prefixIcon: Image.asset("lib/images/cards.png"),
              keyboardtype: TextInputType.number,
              inputFormatters: [
                FilteringTextInputFormatter.digitsOnly,
                LengthLimitingTextInputFormatter(16),
                CardNumberFormatter(),
              ],
            ),
            const Gap(25),
            

            Row(
              children: [
                // For Month and Year
                Flexible(
                  child: MyTextFormField(
                    hintText: "MM/YY", 
                    hideText: false, 
                    controller: _yearMonthController, 
                    fillcolor: colorLightGrey.withAlpha((0.09 * 255).toInt()),
                    keyboardtype: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(4),
                      ExpiryDateFormatter(),
                    ],
                  ),
                ),

                const Gap(25),
                

                // For CSV
                Flexible(
                  child: MyTextFormField(
                    hintText: "Enter CSV", 
                    hideText: true, 
                    controller: _CSVController, 
                    fillcolor: colorLightGrey.withAlpha((0.09 * 255).toInt()),
                    keyboardtype: TextInputType.number,
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(3), // Limit to 3 digits
                    ],
                  ),
                ),
              ],
            ),
            

            const Gap(70),

            MyButton(
              bottonName: "Add Card", 
              onTap: (){}
            )
          ],
        ),
      ),
    );
  }
}




// TextFormField(
            //   controller: _controller,
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.digitsOnly,
            //     LengthLimitingTextInputFormatter(16),
            //     CardNumberFormatter(),
            //   ],
            //   decoration: InputDecoration(
            //     labelText: "Card Number",
            //     hintText: "XXXX XXXX XXXX XXXX",
            //     border: OutlineInputBorder(),
            //   ),
            //   validator: (value) {
            //     if (value == null || value.replaceAll(" ", "").length != 16) {
            //       return "Enter a valid card number";
            //     }
            //     return null;
            //   },
            // ),



// TextFormField(
            //   controller: _yearMonthController,
            //   decoration: InputDecoration(
            //     labelText: "Expiration Date (MM/YY)",
            //     hintText: "MM/YY",
            //     border: OutlineInputBorder(),
            //   ),
            //   keyboardType: TextInputType.number,
            //   inputFormatters: [
            //     FilteringTextInputFormatter.digitsOnly,
            //     LengthLimitingTextInputFormatter(4),
            //     ExpiryDateFormatter(),
            //   ],
            // ),