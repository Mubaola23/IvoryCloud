import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  final Function onButtonPressed;
  final String text;
  final double width;
  
  const CustomButton({
    Key key, this.onButtonPressed, this.text, this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 60, right:60),
      child: Center(
        child: Container(
          height: 50,
          width: width,
          child: RaisedButton(
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25)
            ),
            onPressed: onButtonPressed,
            textColor: Colors.black87,
            color: Colors.white,
            padding: EdgeInsets.all(10.0),
            child: new Text(
               text,
              )
          ),
        ),
      ),);
  }
}
