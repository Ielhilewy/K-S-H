import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final bool obscureText;
  final String? Function(String?)? validator;
  final Widget? suffixIcon;
  final Widget? prefixIcon; // New parameter

  const CustomTextField({
    required this.controller,
    required this.labelText,
    this.obscureText = false,
    this.validator,
    this.suffixIcon,
    this.prefixIcon, // New parameter
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscureText,
      decoration: InputDecoration(
        border: OutlineInputBorder(),
        labelText: labelText,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon, // Assign the prefixIcon property
      ),
      validator: validator,
    );
  }
}
