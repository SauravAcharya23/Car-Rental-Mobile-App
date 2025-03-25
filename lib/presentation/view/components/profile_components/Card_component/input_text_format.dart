import 'package:flutter/services.dart';



// Formatter to add spaces every 4 digits

class CardNumberFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String digitsOnly = newValue.text.replaceAll(RegExp(r'\D'), '');
    String formatted = '';

    for (int i = 0; i < digitsOnly.length; i++) {
      if (i > 0 && i % 4 == 0) formatted += ' ';
      formatted += digitsOnly[i];
    }

    return TextEditingValue(
      text: formatted,
      selection: TextSelection.collapsed(offset: formatted.length),
    );
  }
}


/// Formatter to insert '/' between MM and YY
class ExpiryDateFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    String text = newValue.text.replaceAll(RegExp(r'[^0-9]'), '');

    if (text.length > 4) text = text.substring(0, 4);

    String formattedText = '';
    // Handling deletion properly
    if (oldValue.text.endsWith('/') && oldValue.text.length > newValue.text.length) {
      text = text.substring(0, text.length - 1);
    }

    if (text.length >= 3) {
      formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    } else if (text.length > 2) {
      formattedText = '${text.substring(0, 2)}/';
    } else {
      formattedText = text;
    }
    // if (text.length >= 2) {
    //   formattedText = '${text.substring(0, 2)}/${text.substring(2)}';
    // } else {
    //   formattedText = text;
    // }

    return TextEditingValue(
      text: formattedText,
      selection: TextSelection.collapsed(offset: formattedText.length),
    );
  }
}
