import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/widgets/app_dropdown.dart';
import 'package:IvoryCloud/src/views/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class EditPatientScreen extends StatefulWidget {
  @override
  _EditPatientScreenState createState() => _EditPatientScreenState();
}

class _EditPatientScreenState extends State<EditPatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _ScaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _ScaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    CircleAvatar(
                      radius: 50,
                      backgroundColor: kTextFieldFillColor,
                    ),
                    Icon(Icons.edit),
                  ],
                ),
                kLargeVerticalSpacing,
                Text(
                  'Lorem ipsum dolor sit amet,\n consectetur adipiscing elit, sed do  ',
                  softWrap: true,
                  textAlign: TextAlign.center,
                ),
                kLargeVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.number,
                  hintText: '1234000',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'PATIENT ID',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'Jamiu Okanlawon',
                  validator: validateFullName,
                  filled: false,
                  title: 'NAME',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.datetime,
                  hintText: 'Jamiu Okanlawon',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'D.O.B',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppDropdown(
                  validator: validateGender,
                  label: 'GENDER',
                  value: 'Male',
                  items: ['Male', 'Female'],
                  onChanged: (_) {},
                ),
                kMediumVerticalSpacing,
                AppDropdown(
                  validator: validateNotEmpty,
                  label: 'MARITAL STATUS',
                  value: 'Married',
                  items: ['Married', 'Single'],
                  onChanged: (_) {},
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  validator: validateNotEmpty,
                  keyboardType: TextInputType.text,
                  hintText: 'Local government',
                  filled: false,
                  title: 'LGA',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  validator: validateNotEmpty,
                  keyboardType: TextInputType.text,
                  hintText: 'Lagos',
                  filled: false,
                  title: 'STATE',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'Block 234, GRA Ikeja',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'HOME ADDRESS',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  title: 'PHONE NO',
                  keyboardType: TextInputType.number,
                  hintText: 'Phone Number',
                  filled: false,
                  validator: validatePhoneNumber,
                  maxlength: 11,
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'example@gmail.com',
                  validator: validateEmail,
                  filled: false,
                  title: 'EMAIL',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'Patient type',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'PATIENT TYPE',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: '3:00 PM',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'TIME OF REGISTRATION',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'O-',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'BlOOD GROUP',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: 'O-',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'BlOOD TYPE',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: '150 kg',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'WEIGHT',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  hintText: '150 cm',
                  validator: validateNotEmpty,
                  filled: false,
                  title: 'HEIGHT',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kLargeVerticalSpacing,
                GestureDetector(
                  onTap: () {
                    _updateRecord();
                  },
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 64.0, vertical: 16.0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50.0),
                      color: kPrimaryColor,
                    ),
                    child: Text(
                      'SAVE EDIT',
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                kLargeVerticalSpacing,
              ],
            ),
          ),
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context) {
    Widget cancleButton = FlatButton(
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: kPrimaryColor,
          ),
          child: Text(
            'YES',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );
    Widget continueButton = FlatButton(
      child: GestureDetector(
        onTap: () {
          _updateRecord();
        },
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.0),
            color: Colors.blue.shade200,
          ),
          child: Text(
            'NO',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      ),
    );

    AlertDialog alert = AlertDialog(
      title: Text(
        'Confirm Edit',
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryColor),
      ),
      content: Text(
        'Do you want to continue with your decision to save edit?',
        textAlign: TextAlign.center,
      ),
      actions: [cancleButton, continueButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void _updateRecord() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState.validate()) {
      showAlertDialog(context);
    }
  }
}

String validateEmail(String value) {
  bool emailValid = RegExp(
          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
      .hasMatch(value);
  return !emailValid ? 'Enter a Valid Email Address' : null;
}

String validatePhoneNumber(String value) =>
    value.length < 10 ? 'Enter a Valid Phone Number' : null;

String validateNotEmpty(String value) =>
    value.isEmpty ? 'Field cannot be empty' : null;

String validateFullName(String value) =>
    value.split(' ').length < 2 ? 'Enter a valid Full Name' : null;

String validateGender(String value) =>
    value == 'Gender' ? 'Choose one of male or female' : null;