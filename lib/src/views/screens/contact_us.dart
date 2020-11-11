import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../../core/images.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../widgets/customInputText.dart';

class ContactUs extends StatefulWidget {
  @override
  _ContactUsState createState() => _ContactUsState();
}

class _ContactUsState extends State<ContactUs> {
    final _formKey = GlobalKey<FormState>();


final fields = Padding(
      padding: EdgeInsets.only(top: 20.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
      Text("EMAIL US", textAlign: TextAlign.start,
      style: TextStyle(fontSize: 18, color: Colors.white),),
      CustomInputText(
      hintText: "emailaddress@example.com",
    ),
    Text("CALL US", textAlign: TextAlign.start,
    style: TextStyle(fontSize: 18, color: Colors.white),),
    CustomInputText(
      hintText: "+234 123 456 7890",
    )
        ],
      ),
    );
    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          leading: IconButton(
            icon: Icon( Icons.arrow_back_ios ), 
            onPressed: () {Navigator.pop(context);
            },
          ),
        backgroundColor: Colors.transparent,
         ),

      backgroundColor: kPrimaryColor,
       body: Container(
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.all(36),
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  SvgPicture.asset(logo),
                  Text("Call us to register \n your hospital", textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 26, color: Colors.white),),
                  fields,
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 150),
                   // child: bottom,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
