import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/widgets/app_button.dart';
import 'package:IvoryCloud/src/views/widgets/app_dropdown.dart';
import 'package:IvoryCloud/src/views/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class AddPatientScreen extends StatefulWidget {
  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
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
                  'ENTER PATIENT\'S DETAILS',
                  style: kHeadingText,
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'FULL NAME ',
                  validator: validateFullName,
                  filled: false,
                  title: '',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppDropdown(
                  validator: validateGender,
                  value: 'GENDER',
                  items: ['GENDER', 'Male', 'Female'],
                  onChanged: (_) {},
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'ADDRESS',
                  validator: validateNotEmpty,
                  filled: false,
                  title: '',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  title: '',
                  keyboardType: TextInputType.number,
                  textInputAction: TextInputAction.next,
                  hintText: 'PHONE NUMBER',
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
                  keyboardType: TextInputType.datetime,
                  textInputAction: TextInputAction.next,
                  hintText: 'DATE OF BIRTH',
                  validator: validateNotEmpty,
                  filled: false,
                  title: '',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppDropdown(
                  validator: validateAllergies,
                  value: 'ALLEGRIES',
                  items: ['ALLEGRIES', 'ULCER', 'COLD'],
                  onChanged: (_) {},
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  validator: validateNotEmpty,
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.next,
                  hintText: 'DISEASE',
                  filled: false,
                  title: '',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kMediumVerticalSpacing,
                AppDropdown(
                  validator: validateGender,
                  value: 'BLOOD TYPE',
                  items: ['BLOOD TYPE', 'O+', 'O-'],
                  onChanged: (_) {},
                ),
                kMediumVerticalSpacing,
                AppTextField(
                  keyboardType: TextInputType.text,
                  textInputAction: TextInputAction.done,
                  hintText: 'ADDITIONAL INFO',
                  validator: validateNotEmpty,
                  filled: false,
                  title: '',
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: kPrimaryColor)),
                ),
                kLargeVerticalSpacing,
                AppButton(
                  onPressed: () {
                    _addPatient();
                  },
                  text: 'ADD PATIENT',
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
    Widget yesButton = FlatButton(
      onPressed: () => _addPatient(),
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
    );
    Widget noButton = FlatButton(
      onPressed: () => Navigator.pop(context),
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
    );

    AlertDialog alert = AlertDialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(32))),
      title: Text(
        'Confirm Edit',
        textAlign: TextAlign.center,
        style: TextStyle(color: kPrimaryColor),
      ),
      content: Text(
        'Do you want to continue with your decision to save edit?',
        textAlign: TextAlign.center,
      ),
      actions: [yesButton, noButton],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return alert;
        });
  }

  void _addPatient() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState.validate()) {
      showAlertDialog(context);
    }
  }
}

String validatePhoneNumber(String value) =>
    value.length < 10 ? 'Enter a Valid Phone Number' : null;

String validateNotEmpty(String value) =>
    value.isEmpty ? 'Field cannot be empty' : null;

String validateFullName(String value) =>
    value.split(' ').length < 2 ? 'Enter a valid Full Name' : null;

String validateGender(String value) =>
    value == 'Gender' ? 'Choose one of male or female' : null;

String validateAllergies(String value) =>
    value == 'Allergies' ? 'Choose an allergy' : null;

String validateBloodType(String value) =>
    value == 'Blood Type' ? 'Choose a blood type' : null;
