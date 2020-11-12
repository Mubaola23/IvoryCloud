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
    child: Container(
      margin: EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            children: <Widget>[
              Text(
                "EMAIL US",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          CustomInputText(
            hintText: "emailaddress@example.com",
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            children: <Widget>[
              Text(
                "CALL US",
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ],
          ),
          CustomInputText(
            hintText: "+234 123 456 7890",
          )
        ],
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: Container(
        height: double.infinity,
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage(backgroundImage), fit: BoxFit.cover)),
        //margin: EdgeInsets.symmetric(horizontal: 16),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            //padding: EdgeInsets.all(36),
            child: Container(
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 50,
                  ),
                  Row(
                    children: <Widget>[
                      Container(
                        width: 40,
                        height: 40,
                        margin: EdgeInsets.only(left: 7),
                        padding: EdgeInsets.only(left: 7),
                        decoration: BoxDecoration(
                            border: Border.all(width: 2, color: Colors.white),
                            borderRadius: BorderRadius.circular(20)),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                  SvgPicture.asset(
                    logo,
                    height: 50,
                  ),
                  SizedBox(
                    height: 70,
                  ),
                  Text(
                    "Contact us to register \n your hospital",
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 26, color: Colors.white),
                  ),
                  SizedBox(
                    height: 30,
                  ),
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
