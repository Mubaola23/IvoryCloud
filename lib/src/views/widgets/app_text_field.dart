import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppTextField extends StatelessWidget {
  final String hintText;
  final bool filled;
  final bool showCounterText;
  final bool obscureText;
  final Widget prefixIcon;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final Function(String) validator;
  final bool enabled;
  final Function(String) onFieldSubmitted;
  final TextInputAction textInputAction;
  final int maxlength;
  final InputBorder border;
  final InputBorder enabledBorder;
  final String title;

  const AppTextField({
    Key key,
    @required this.hintText,
    this.filled,
    this.enabledBorder,
    this.keyboardType,
    this.border,
    this.validator,
    this.controller,
    this.onFieldSubmitted,
    this.enabled,
    this.maxlength,
    this.prefixIcon,
    this.obscureText,
    this.title,
    this.textInputAction,
    this.showCounterText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title),
        TextFormField(
          keyboardType: keyboardType,
          validator: validator,
          controller: controller,
          textInputAction: textInputAction,
          obscureText: obscureText ?? false,
          onFieldSubmitted: onFieldSubmitted,
          maxLength: maxlength,
          enabled: enabled,
          decoration: InputDecoration(
            hintText: hintText,
            enabledBorder: enabledBorder,
            border: border,
            filled: filled,
            fillColor: kTextFieldFillColor,
            labelStyle: TextStyle(color: kHintColor),
            contentPadding: const EdgeInsets.all(16),
            counterText: showCounterText ? null : "",
            prefixIcon: prefixIcon,
          ),
        ),
      ],
    );
  }
}
