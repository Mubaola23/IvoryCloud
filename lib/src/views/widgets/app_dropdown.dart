import 'package:flutter/material.dart';

import '../../core/constants.dart';

class AppDropdown extends StatelessWidget {
  final String label;
  final List<String> items;
  final String value;
  final void Function(String) onChanged;
  final String Function(String) validator;
  final String hintText;

  const AppDropdown({
    Key key,
    this.label,
    @required this.items,
    @required this.value,
    @required this.onChanged,
    this.validator,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        label != null ? Text(label.toUpperCase()) : SizedBox(),
        label != null ? SizedBox(height: 6) : SizedBox(),
        DropdownButtonFormField(
          items: items.map(
            (String item) {
              return new DropdownMenuItem(
                value: item,
                child: Text(item),
              );
            },
          ).toList(),
          onChanged: onChanged,
          value: value,
          style: TextStyle(color: Colors.black87, fontSize: 18),
          validator: validator,
          icon: Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: TextStyle(color: Colors.grey),
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
              borderSide: BorderSide(color: kPrimaryColor, width: 0.5),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor.withOpacity(0.8)),
              borderRadius: BorderRadius.circular(5),
            ),
            disabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
          ),
        ),
      ],
    );
  }
}
