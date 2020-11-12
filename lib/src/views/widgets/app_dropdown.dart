import 'package:IvoryCloud/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppDropdown extends StatelessWidget {
  final List<String> items;
  final String value;
  final String label;
  final void Function(String) onChanged;
  final String Function(String) validator;

  const AppDropdown({
    Key key,
    @required this.items,
    @required this.value,
    @required this.onChanged,
    this.label,
    this.validator,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
        ),
        DropdownButtonFormField(
          items: items.map(
            (String item) {
              return new DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(fontSize: 12),
                ),
              );
            },
          ).toList(),
          onChanged: onChanged,
          value: value,
          validator: validator,
          icon: Icon(Icons.arrow_drop_down),
          decoration: InputDecoration(
            contentPadding: EdgeInsets.all(16.0),
            filled: false,
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
            border: OutlineInputBorder(
                borderSide: BorderSide(color: kPrimaryColor)),
          ),
        ),
      ],
    );
  }
}
