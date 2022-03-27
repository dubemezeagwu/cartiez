import 'package:cartiez/utils/styles.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    Key? key,
    required this.title,
    this.suffixIcon,
    this.textFormKey,
    this.controller,
    this.obscureText,
    this.enableInteractive,
    this.validator,
    this.prefixIcon,
    required this.enabled,
  }) : super(key: key);


  final String title;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final Key? textFormKey;
  final TextEditingController? controller;
  final bool? obscureText;
  final bool? enableInteractive;
  final String? Function(String?)? validator;
  final bool enabled;



  @override
  Widget build(BuildContext context) {
    TextStyle? style = regular11;
    return TextFormField(
      key: textFormKey,
      controller: controller,
      obscureText: obscureText!,
      validator: validator,
      enableInteractiveSelection: enableInteractive,
      decoration: InputDecoration(
          labelText: title,
          labelStyle: style,
          enabled: enabled,
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
            borderSide: BorderSide(
              color: Constants.primaryColor
            )
          ),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          filled: true,
          fillColor: Constants.kTextFieldColor,
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon ?? null
      ),
    );
  }
}
