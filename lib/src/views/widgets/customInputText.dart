import 'package:flutter/material.dart';

class CustomInputText extends StatelessWidget {
  final Function(String) validator;
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final String labelText;

  const CustomInputText(
      {this.labelText,
      this.hintText,
      this.controller,
      this.obscureText,
      this.validator});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: obscureText ?? false,
      style: TextStyle(
        color: Colors.white,
      ),
      cursorColor: Colors.white,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        labelStyle: TextStyle(color: Colors.white),
        hintStyle: TextStyle(fontSize: 16.0, color: Colors.white),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.white,
          ),
        ),
        // labelText: hintText,
      ),
    );
  }
}
