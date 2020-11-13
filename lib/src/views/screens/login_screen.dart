import 'dart:ui';

import 'package:IvoryCloud/src/views/widgets/app_text_field.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/images.dart';
import '../widgets/customButton.dart';
import '../widgets/customInputText.dart';
import 'home_screen.dart';
import 'signup_screen.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        padding: EdgeInsets.fromLTRB(32, 48, 32, 0),
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(backgroundImage), fit: BoxFit.cover),
        ),
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
                        fontSize: 40,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                SvgPicture.asset(logo, width: 45, height: 45),
                SizedBox(height: 32),
                AppTextField(
                  label: 'EMAIL',
                  borderColor: Colors.white,
                  textColor: Colors.white,
                  hintText: 'john.doe@gmail.com',
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
