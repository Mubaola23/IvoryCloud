// import 'package:flutter/material.dart';

// import '../../core/constants.dart';

// class AppTextField extends StatelessWidget {

//   const AppTextField({
//     Key key,
//     @required this.hintText,
//     this.filled,
//     this.enabledBorder,
//     this.keyboardType,
//     this.border,
//     this.validator,
//     this.controller,
//     this.onFieldSubmitted,
//     this.enabled,
//     this.maxlength,
//     this.prefixIcon,
//     this.obscureText,
//     this.title,
//     this.textInputAction,
//     this.showCounterText = false,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       crossAxisAlignment: CrossAxisAlignment.start,
//       children: [
//         Text(title),
//         TextFormField(
//           keyboardType: keyboardType,
//           validator: validator,
//           controller: controller,
//           textInputAction: textInputAction,
//           obscureText: obscureText ?? false,
//           onFieldSubmitted: onFieldSubmitted,
//           maxLength: maxlength,
//           enabled: enabled,
//           decoration: InputDecoration(
//             hintText: hintText,
//             enabledBorder: enabledBorder,
//             border: border,
//             filled: filled,
//             fillColor: kTextFieldFillColor,
//             labelStyle: TextStyle(color: kHintColor),
//             contentPadding: const EdgeInsets.all(16),
//             counterText: showCounterText ? null : "",
//             prefixIcon: prefixIcon,
//           ),
//         ),
//       ],
//     );
//   }
// }

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
  final String label;
  final int maxLines;
  final Widget suffixIcon;
  final void Function(String) onChanged;
  final Color borderColor;
  final Color textColor;

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
    this.filled,
    this.showCounterText,
    this.prefixIcon,
    this.onFieldSubmitted,
    this.maxlength,
    this.border,
    this.enabledBorder,
    this.title,
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
            prefixIcon: prefixIcon,
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
