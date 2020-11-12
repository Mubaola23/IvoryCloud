import 'package:IvoryCloud/src/core/utilities/notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../models/patient.dart';
import '../../viewmodels/add_patient_viewmodel.dart';
import '../widgets/app_dropdown.dart';
import '../widgets/app_text_field.dart';
import 'home_screen.dart';

class AddPatientScreen extends StatefulWidget {
  @override
  _AddPatientScreenState createState() => _AddPatientScreenState();
}

class _AddPatientScreenState extends State<AddPatientScreen> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  String fullName;
  int age;
  String maritalStatus = 'Select Marital Status';
  String gender = 'Select Gender';
  String lga;
  String state;
  String homeAddress;
  String phoneNumber;
  String emailAddress;
  String nextOfKin;
  String symptom;
  String comment;
  String patientType = 'Select Patient Type';

  void addPatient(AddPatientViewModel addPatientViewModel) async {
    FocusScope.of(context).requestFocus(FocusNode());

    if (_formKey.currentState.validate()) {
      final patient = Patient(
        age: age,
        comment: comment,
        emailAddress: emailAddress,
        fullName: fullName,
        gender: gender,
        homeAddress: homeAddress,
        lga: lga,
        maritalStatus: maritalStatus,
        nextOfKin: nextOfKin,
        passport: 'JJJ',
        patientType: patientType,
        phoneNumber: phoneNumber,
        state: state,
        symptom: symptom,
        timestamp: DateTime.now().toUtc().toString(),
      );

      await addPatientViewModel.addPatient(patient);

      if (addPatientViewModel.error != null) {
        scaffoldKey.currentState.showSnackBar(
          snackBar(addPatientViewModel.error.toString()),
        );
      } else {
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) => HomeScreen()),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<AddPatientViewModel>(
      create: (context) => AddPatientViewModel(),
      child: Scaffold(
        appBar: AppBar(
          title: Text('Enter Patient Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 8.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  kMediumVerticalSpacing,
                  AppTextField(
                    label: 'Full Name',
                    hintText: 'John Doe',
                    validator: (val) =>
                        val.isEmpty ? 'Name cannot be empty' : null,
                    onChanged: (val) => fullName = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Age',
                    hintText: '19',
                    keyboardType: TextInputType.number,
                    validator: (val) =>
                        val.isEmpty ? 'Age cannot be empty' : null,
                    onChanged: (val) => age = int.parse(val),
                  ),
                  kSmallVerticalSpacing,
                  AppDropdown(
                    label: 'Marital Status',
                    items: [
                      'Select Marital Status',
                      'Married',
                      'Single',
                      'Divorced'
                    ],
                    onChanged: (val) => maritalStatus = val,
                    value: maritalStatus,
                    validator: (val) => val == 'Select Marital Status'
                        ? 'Please select a valid marital status'
                        : null,
                  ),
                  kSmallVerticalSpacing,
                  AppDropdown(
                    label: 'Gender',
                    items: ['Select Gender', 'Male', 'Female'],
                    onChanged: (val) => gender = val,
                    value: gender,
                    validator: (val) => val == 'Select Gender'
                        ? 'Please select a valid gender'
                        : null,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'LGA',
                    hintText: 'Ikeja Local Government',
                    validator: (val) =>
                        val.isEmpty ? 'LGA cannot be empty' : null,
                    onChanged: (val) => lga = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'State',
                    hintText: 'Lagos State',
                    validator: (val) =>
                        val.isEmpty ? 'State cannot be empty' : null,
                    onChanged: (val) => state = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Home Address',
                    hintText: '57, Marina Street',
                    validator: (val) =>
                        val.isEmpty ? 'Home address cannot be empty' : null,
                    onChanged: (val) => homeAddress = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Phone Number',
                    keyboardType: TextInputType.number,
                    hintText: '08000000000',
                    validator: (val) =>
                        val.isEmpty ? 'Phone number cannot be empty' : null,
                    onChanged: (val) => phoneNumber = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Email Address',
                    keyboardType: TextInputType.emailAddress,
                    hintText: 'john.doe@gmail.com',
                    validator: (val) =>
                        val.isEmpty ? 'Email cannot be empty' : null,
                    onChanged: (val) => emailAddress = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Next of Kin',
                    hintText: 'John Smith',
                    validator: (val) =>
                        val.isEmpty ? 'Next of Kin cannot be empty' : null,
                    onChanged: (val) => nextOfKin = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Symptom',
                    hintText: 'Headache',
                    onChanged: (val) => symptom = val,
                  ),
                  kSmallVerticalSpacing,
                  AppTextField(
                    label: 'Comment',
                    hintText: 'Okay',
                    onChanged: (val) => comment = val,
                  ),
                  kSmallVerticalSpacing,
                  AppDropdown(
                    label: 'Patient Type',
                    items: ['Select Patient Type', 'In Patient', 'Out Patient'],
                    onChanged: (val) => patientType = val,
                    value: patientType,
                    validator: (val) => val == 'Select Patient Type'
                        ? 'Please select a valid patient type'
                        : null,
                  ),
                  kSmallVerticalSpacing,
                  Consumer<AddPatientViewModel>(
                    builder: (context, addPatientViewModel, _) => RaisedButton(
                      onPressed: () => addPatient(addPatientViewModel),
                      color: kPrimaryColor,
                      textColor: Colors.white,
                      padding:
                          EdgeInsets.symmetric(vertical: 16, horizontal: 24.0),
                      child: addPatientViewModel.state == NotifierState.loading
                          ? SizedBox(
                              width: 25.0,
                              height: 25.0,
                              child: CircularProgressIndicator(
                                valueColor:
                                    AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Text(
                              'ADD PATIENT',
                              style: TextStyle(fontSize: 16),
                            ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget snackBar(String message) {
    return SnackBar(
      behavior: SnackBarBehavior.floating,
      content: Text(message),
      duration: Duration(seconds: 4),
      backgroundColor: Colors.red,
    );
  }
}
