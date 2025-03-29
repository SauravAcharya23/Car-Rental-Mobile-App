import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_credit_card/flutter_credit_card.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';


Widget buildFadeEffect({required bool top}) {
  return Container(
    height: 30, // Adjust the height for the fading effect
    decoration: BoxDecoration(
      gradient: LinearGradient(
        begin: top ? Alignment.topCenter : Alignment.bottomCenter,
        end: top ? Alignment.bottomCenter : Alignment.topCenter,
        colors: [
          // Colors.white.withOpacity(0.9),
          // Colors.white.withOpacity(0),
          colorWhite.withAlpha((0.9 * 255).toInt()),
          colorWhite.withAlpha((0 * 255).toInt()),
        ],
      ),
    ),
  );
}

Widget creditCardWidget({
  required String cardNumber, 
  required String expiryDate, 
  required String cardHolderName, 
  required String cvvCode,
  required bool enableFloatingCard,
  required List<Color> colors
  }){
  return CreditCardWidget(
    cardNumber: cardNumber, 
    expiryDate: expiryDate,
    cardHolderName: cardHolderName,
    cvvCode: cvvCode,
    showBackView: false, 
    glassmorphismConfig: Glassmorphism(
      blurX: 10.0,
      blurY: 10.0,
      gradient: 
      LinearGradient(
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
        colors: colors,
        // <Color>[
        //   colorPurple,
        //   colorBlue
        //   // Colors.grey.withAlpha(20),
        //   // Colors.white.withAlpha(20),
        // ],
        stops: const <double>[
          0.3,
          0,
        ],
      ),
    ),
    enableFloatingCard: enableFloatingCard,
    floatingConfig: FloatingConfig(
      isGlareEnabled: true,
      isShadowEnabled: true,
      shadowConfig: FloatingShadowConfig(
        // offset: Offset(10, 10),
        // color: colorBlack,
        // blurRadius: 15,
      ),
    ),
    // labelValidThru: 'VALID\nTHRU',
    labelCardHolder: 'CARD HOLDER',
    cardType: CardType.mastercard,
    isHolderNameVisible: true,
    // height: 175,
    animationDuration: Duration(milliseconds: 1000),
    onCreditCardWidgetChange: (CreditCardBrand brand) {}, // Callback for anytime credit card brand is changed
  );
}


class SnackBarHelper {

  static void showSuccessSnackBar(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.success(
        message: message,
      ),
    );
  }

  static void showErrorSnackBar(BuildContext context, String message) {
    showTopSnackBar(
      Overlay.of(context),
      CustomSnackBar.error(
        message: message,
      ),
    );
  }
}


String checkBrand(String name){
  if(name.length == 3){
    return name.toUpperCase();
  }else{
    return name[0].toUpperCase() + name.substring(1);
  }
}