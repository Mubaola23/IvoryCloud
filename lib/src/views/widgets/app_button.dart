import 'package:IvoryCloud/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final Color color;
  final Color textColor;
  final bool isLoading;
  final String label;

  const AppButton({
    Key key,
    this.onPressed,
    this.color = kPrimaryColor,
    this.textColor = Colors.white,
    this.isLoading = false,
    this.label,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: onPressed,
      color: color,
      textColor: textColor,
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
      child: isLoading
          ? SizedBox(
              width: 25.0,
              height: 25.0,
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              ),
            )
          : Text(
              label,
              style: TextStyle(fontSize: 16),
            ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),
    );
  }
}
