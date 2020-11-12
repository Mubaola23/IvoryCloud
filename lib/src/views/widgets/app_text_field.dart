import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppTextField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool obscureText;
  final int maxLines;
  final bool enabled;
  final TextEditingController controller;
  final Widget suffixIcon;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final TextInputType keyboardType;
  final Color borderColor;
  final Color textColor;
  final TextInputAction textInputAction;

  const AppTextField({
    Key key,
    this.label,
    this.hintText,
    this.controller,
    this.suffixIcon,
    this.enabled,
    this.onChanged,
    this.maxLines,
    this.obscureText,
    this.validator,
    this.keyboardType,
    this.textInputAction,
    this.borderColor,
    this.textColor = Colors.black87,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label.toUpperCase()) : SizedBox(),
        label != null ? SizedBox(height: 6) : SizedBox(),
        TextFormField(
          controller: controller,
          style: TextStyle(color: textColor, fontSize: 18),
          onChanged: onChanged,
          maxLines: maxLines ?? 1,
          validator: validator,
          keyboardType: keyboardType,
          enabled: enabled,
          textInputAction: textInputAction ?? TextInputAction.next,
          obscureText: obscureText ?? false,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
            suffixIcon: suffixIcon,
            contentPadding: EdgeInsets.all(16.0),
            border: InputBorder.none,
            filled: false,
            errorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.red.shade900, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide:
                  BorderSide(color: borderColor ?? kPrimaryColor, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: borderColor ?? kPrimaryColor),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
