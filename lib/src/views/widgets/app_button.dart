import 'package:IvoryCloud/src/core/constants.dart';
import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final Function onPressed;
  final String text;

  const AppButton({
    Key key,
    this.onPressed,
    @required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 40, right: 40),
      child: Center(
        child: Container(
          child: RaisedButton(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25)),
              onPressed: onPressed,
              textColor: Colors.white,
              color: kPrimaryColor,
              padding: EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
              child: new Text(
                text,
              )),
        ),
      ),
    );
  }
}
