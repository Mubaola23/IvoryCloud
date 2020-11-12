import 'dart:ui';

import 'package:IvoryCloud/src/views/screens/home_screen.dart';
import 'package:IvoryCloud/src/views/screens/signup_screen.dart';
import 'package:IvoryCloud/src/views/widgets/customButton.dart';
import 'package:IvoryCloud/src/views/widgets/customInputText.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';
import '../../core/images.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: kPrimaryColor,
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
                    Text(
                      "Login",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 50,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Center(child: SvgPicture.asset(logo)),
                SizedBox(
                  height: 30,
                ),
                Row(children: [
                  Text(
                    "EMAIL",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ]),
                
                CustomInputText(
                  validator: validateNotEmpty,
                  hintText: "emailaddress@example.com",
                ),
                SizedBox(
                  height: 20,
                ),
                Row(children: [
                  Text(
                    "PASSWORD",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  )
                ]),
                CustomInputText(
                  validator: validateNotEmpty,
                  hintText: "***********",
                ),
                SizedBox(
                  height: 50,
                ),
                CustomButton(
                  text: "LOGIN",
                  width: 300.0,
                  onButtonPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => HomeScreen()));
                  },
                ),
                SizedBox(
                  height: 50,
                ),
                RichText(
                    text: TextSpan(
                        text: "DON'T HAVE AN ACCOUNT? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                        children: [
                      TextSpan(
                          text: "SIGN UP",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.white,
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => SignUp()));
                            })
                    ]))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

String validateNotEmpty(String value) =>
    value.isEmpty ? 'Field cannot be empty' : null;