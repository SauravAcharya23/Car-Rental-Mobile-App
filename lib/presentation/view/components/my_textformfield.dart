import 'package:car_rental_app/core/ui/colors.dart';
import 'package:flutter/material.dart';

class MyTextFormField extends StatefulWidget {

  final String hintText;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final bool hideText;
  final dynamic controller;
  final Color fillcolor;

  const MyTextFormField({
    super.key, 
    required this.hintText,
    this.prefixIcon,
    this.suffixIcon,
    required this.hideText,
    required this.controller,
    required this.fillcolor
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
    return SizedBox(
      height: 50,
      child: TextFormField(
        focusNode: _focusNode,
        controller: widget.controller,
        decoration: InputDecoration(
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
          prefixIcon: ColorFiltered(
            colorFilter: ColorFilter.mode(
              _isFocused ? colorLightBlue : colorLightGrey, // Change color dynamically
              BlendMode.srcIn,
            ),
            child: widget.prefixIcon,
          ),
          suffixIcon: widget.suffixIcon,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            // color: colorLightGrey.withOpacity(.4)
            color: colorLightGrey.withAlpha((0.4 * 255).toInt()),
          )
        ),
        obscureText: widget.hideText,
      ),
    );
  }
}