import 'package:car_rental_app/core/network/services/database.dart';
import 'package:car_rental_app/core/ui/colors.dart';
import 'package:car_rental_app/core/ui/string_constrants.dart';
import 'package:car_rental_app/model/user/user_model.dart';
import 'package:car_rental_app/presentation/view/components/extra/extra.dart';
import 'package:car_rental_app/presentation/view/components/my_button.dart';
import 'package:car_rental_app/presentation/view/components/my_textformfield.dart';
import 'package:car_rental_app/presentation/view/components/profile_components/Card_component/input_text_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddCard extends ConsumerStatefulWidget {
  const AddCard({super.key});

  @override
  ConsumerState<AddCard> createState() => _AddCardState();
}

class _AddCardState extends ConsumerState<AddCard> {

  final TextEditingController _controller = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _yearMonthController = TextEditingController();
  final TextEditingController _csvController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _isLoading = StateProvider.autoDispose<bool>((ref) => false,);

  @override
  void initState() {
    // Listen for changes in the text field to update the state
     _controller.addListener(() {
      setState(() {}); // Rebuild the widget whenever the text changes
    });
    _nameController.addListener(() {
      setState(() {}); // Rebuild the widget whenever the text changes
    });
    _yearMonthController.addListener(() {
      setState(() {}); // Rebuild on year-month change
    });
    _csvController.addListener(() {
      setState(() {}); // Rebuild on CSV change
    });
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    _nameController.dispose();
    _yearMonthController.dispose();
    _csvController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // Get the user object from the Provider safely.
    final user = context.watch<UserModel?>();
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
        // actions: [
          
        //   GestureDetector(
        //     onTap: () => Navigator.pushNamed(context, Routes.scanCard),
        //     child: Image.asset('lib/images/focus.png')
        //   ),
        //   const Gap(20),
        // ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20, ), //vertical: 60,
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              
              creditCardWidget(
                cardNumber: _controller.text.trim().toString(),
                expiryDate: _yearMonthController.text.trim().toString(), 
                cardHolderName: _nameController.text.trim().toString(),//"Saurav", 
                cvvCode: _csvController.text.trim().toString(), 
                enableFloatingCard: true,
                colors: [
                  Colors.grey.withAlpha(20),
                  Colors.white.withAlpha(20),
                ]
              ),
          
              const Gap(15),
          
              // For Card Name
              MyTextFormField(
                hintText: "Name on card", 
                hideText: false , 
                controller: _nameController, 
                fillcolor: colorLightGrey.withAlpha((0.09 * 255).toInt()),
                prefixIcon: Image.asset("lib/images/person.png"),
                validate: (val) {
                  if(val!.isEmpty){
                    return "*Name field required";
                  }else{
                    return null;
                  }
                },
              ),
              const Gap(25),
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
                validate: (val) {
                  if(val!.isEmpty|| val.replaceAll(" ", "").length != 16){
                    return "*Enter a valid card number";
                  }else{
                    return null;
                  }
                },
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
                      validate: (val) {
                        if(val!.isEmpty){
                          return "*Expiry Date field required";
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
          
                  const Gap(25),
                  
          
                  // For CSV
                  Flexible(
                    child: MyTextFormField(
                      hintText: "Enter CSV", 
                      hideText: true, 
                      controller: _csvController, 
                      fillcolor: colorLightGrey.withAlpha((0.09 * 255).toInt()),
                      keyboardtype: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(3), // Limit to 3 digits
                      ],
                      validate: (val) {
                        if(val!.isEmpty){
                          return "*CVV field required";
                        }else{
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              
          
              const Gap(70),
          
              ref.watch(_isLoading) == true
              ? CircularProgressIndicator()
              : MyButton(
                bottonName: "Add Card", 
                onTap: ()async{
                  if(_formKey.currentState != null){
                    if(_formKey.currentState!.validate()){
                      ref.read(_isLoading.notifier).state = true; // Use `read` for updates
                      String result = await DatabaseService(uid: user?.uid)
                                        .addCards(
                                          cardName: _nameController.text.trim().toString(), 
                                          cardNumber: _controller.text.trim().toString(), 
                                          expiryDate: _yearMonthController.text.trim().toString(), 
                                          cvv: _csvController.text.trim().toString()
                                        );
                      if(result == '1'){
                        _nameController.clear();
                        _controller.clear();
                        _yearMonthController.clear();
                        _csvController.clear();
                        SnackBarHelper.showSuccessSnackBar(context,cardAddedSuccess);
                      }else if(result == '2'){
                        SnackBarHelper.showSuccessSnackBar(context,cardAlreadyExists);
                      }else{
                        SnackBarHelper.showErrorSnackBar(context, result);
                      }
                      ref.read(_isLoading.notifier).state = false; // Use `read` for updates
                    }
                  }
                  
                }
              )
            ],
          ),
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