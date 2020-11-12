import 'dart:ui';

import 'package:IvoryCloud/src/views/widgets/customButton.dart';
import 'package:IvoryCloud/src/views/widgets/customInputText.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';
import '../../core/images.dart';
import '../screens/login_screen.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     // backgroundColor: kPrimaryColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage(backgroundImage), 
          fit: BoxFit.cover)
        ),
        child: SingleChildScrollView(
                child: Container(
            margin: EdgeInsets.symmetric(horizontal: 30, vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    Text("Sign up", style: TextStyle(
                      color: Colors.white, fontSize: 50,
                    ),),
                  ],
                ),
                SizedBox(height: 50,),
                Center(child: SvgPicture.asset(logo)),
                SizedBox(height: 30,),
                Row(
                  children: [
                    Text("USER ID", style: TextStyle(
                      color: Colors.white, fontSize: 14,
                    ),)
                  ]
                ),
                CustomInputText(hintText: "FHEO36VS34J",),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("EMAIL", style: TextStyle(
                      color: Colors.white, fontSize: 14,
                    ),)
                  ]
                ),
                CustomInputText(hintText: "emailaddress@example.com",),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("PASSWORD", style: TextStyle(
                      color: Colors.white, fontSize: 14,
                    ),)
                  ]
                ),
                CustomInputText(hintText: "***********",),
                SizedBox(height: 20,),
                Row(
                  children: [
                    Text("CONFIRM PASSWORD", style: TextStyle(
                      color: Colors.white, fontSize: 14,
                    ),)
                  ]
                ),
                CustomInputText(hintText: "***********",),
                SizedBox(height: 20,),
                CustomButton(text: "SIGN UP", width: 300.0,
                onButtonPressed: (){},
                ),
                SizedBox(height: 10,),
                RichText(
                  text: TextSpan(text:"ALREADY HAVE AN ACCOUNT? ",              
                style: TextStyle(
                      color: Colors.white, fontSize: 14,
                    ),
                    children: [
                      TextSpan(text: "LOGIN", style: TextStyle(
                      decoration: TextDecoration.underline,
                      decorationColor: Colors.white,
                      color: Colors.white,
                      fontSize: 16,
                    ),
                    recognizer: TapGestureRecognizer()..onTap = (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context)=> Login()));})
                    ])
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}