import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyTextFormField extends StatefulWidget {

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hideText;
  final dynamic controller;
  final Color fillcolor;
  final TextInputType? keyboardtype;
  final List<TextInputFormatter>? inputFormatters;
  final bool? readOnly;
  final Function()? onTap;
  final String? Function(String?) validate;

  const MyTextFormField({
    super.key, 
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.hideText,
    required this.controller,
    required this.fillcolor,
    this.keyboardtype,
    this.inputFormatters,
    this.readOnly,
    this.onTap,
    required this.validate
  });

  @override
  State<MyTextFormField> createState() => _MyTextFormFieldState();
}

class _MyTextFormFieldState extends State<MyTextFormField> {

  final FocusNode _focusNode = FocusNode();
  bool _isFocused = false;

  @override
  void initState() {
    _focusNode.addListener(() {
      setState(() {
        _isFocused = _focusNode.hasFocus;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      focusNode: _focusNode,
      controller: widget.controller,
      keyboardType: widget.keyboardtype,
      inputFormatters: widget.inputFormatters,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16), // Adjust padding
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8.0)
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(8.0)
        ),
        fillColor: widget.fillcolor, //colorLightGrey.withOpacity(0.05), // 5% opacity
        filled: true,
        prefixIcon: widget.prefixIcon != null
          ? ColorFiltered(
              colorFilter: ColorFilter.mode(
                _isFocused ? colorLightBlue : colorLightGrey,
                BlendMode.srcIn,
              ),
              child: widget.prefixIcon,
            )
          : null,
        suffixIcon: widget.suffixIcon,
        hintText: widget.hintText,
        hintStyle: TextStyle(
          // color: colorLightGrey.withOpacity(.4)
          color: colorLightGrey.withAlpha((0.4 * 255).toInt()),
        ),
        errorStyle: const TextStyle(
          color: colorRed,
          fontSize: 12.0, // Adjust font size as needed
        ),
        errorMaxLines: 1, // Prevents large error messages from wrapping
        errorBorder: InputBorder.none, // Removes error border
        focusedErrorBorder: InputBorder.none, // Removes focused error border
      ),
      obscureText: widget.hideText,
      readOnly: widget.readOnly ?? false,
      onTap: widget.onTap,
      validator: widget.validate,
    );
  }
}