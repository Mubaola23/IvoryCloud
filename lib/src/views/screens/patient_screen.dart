import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/screens/add_visits.dart';
import 'package:IvoryCloud/src/views/screens/all_reports_screen.dart';
import 'package:IvoryCloud/src/views/screens/all_visits_screen.dart';
import 'package:IvoryCloud/src/views/screens/edit_patient_screen.dart';
import 'package:IvoryCloud/src/views/widgets/app_button.dart';
import 'package:IvoryCloud/src/views/widgets/app_text_field.dart';
import 'package:flutter/material.dart';

class PatientScreen extends StatefulWidget {
  @override
  _PatientScreenState createState() => _PatientScreenState();
}

class _PatientScreenState extends State<PatientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () => () {},
              child: Icon(
                Icons.edit,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
//              header(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: kTextFieldFillColor,
                  )
                ],
              ),
              kMediumVerticalSpacing,
              Text(
                'Jamiu Okanlawon',
                style: kHeadingText,
              ),
              Container(
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: kPrimaryColor,
                          blurRadius: 2.0,
                          offset: Offset(0.0, 0.0))
                    ]),
                child: Column(
                  children: [
                    PatientDetail(title: "ID", description: "123400"),
                    PatientDetail(title: "SEX", description: "M"),
                    PatientDetail(title: "NEXT OF KIN", description: "Example"),
                    PatientDetail(
                        title: "Email", description: "lorem@example.com"),
                    PatientDetail(title: "AGE", description: "21"),
                    PatientDetail(title: "BLOOD GROUP", description: "O-"),
                    PatientDetail(title: "GENOTYPE", description: "AA"),
                    PatientDetail(
                        title: "CONTACT", description: "+234 802 384 8934"),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(24),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: kPrimaryColor,
                          blurRadius: 2.0,
                          offset: Offset(0.0, 0.0))
                    ]),
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'enter new report',
                        style: kLabelText,
                      ),
                      kMediumVerticalSpacing,
                      Text("REPORT:"),
                      kTinyVerticalSpacing,
                      AppTextField(
                          // title: '',
                          // keyboardType: TextInputType.text,
                          // validator: validateNotEmpty,
                          // textInputAction: TextInputAction.next,
                          // hintText: 'file a report',
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: kPrimaryColor)),
                          // border: OutlineInputBorder(
                          //     borderSide: BorderSide(color: kPrimaryColor)),
                          ),
                      kMediumVerticalSpacing,
                      Text("EMERGENCY LEVEL:"),
                      kTinyVerticalSpacing,
                      AppTextField(
                          // title: '',
                          // keyboardType: TextInputType.text,
                          // validator: validateNotEmpty,
                          // textInputAction: TextInputAction.done,
                          // hintText: 'file emergency level',
                          // enabledBorder: OutlineInputBorder(
                          //     borderSide: BorderSide(color: kPrimaryColor)),
                          // border: OutlineInputBorder(
                          //     borderSide: BorderSide(color: kPrimaryColor)),
                          ),
                      kLargeVerticalSpacing,
                      AppButton(
                        onPressed: () {
                          _submit();
                        },
                        text: 'SUBMIT',
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Reports",
                      style: kHeadingText,
                    ),
                    Card(child: _reports()),
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Visits",
                      style: kHeadingText,
                    ),
                    Card(child: _visits()),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState.validate()) {}
  }

  Widget _reports() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 2.5),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => ListTile(
//              isThreeLine: true,
              leading: Card(
                color: kTextFieldFillColor,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 8.0),
                  child: Column(
                    children: [
                      Text(
                        'Nov',
                        style: TextStyle(fontSize: 12),
                      ),
                      Text('09', style: TextStyle(fontSize: 12))
                    ],
                  ),
                ),
              ),
              title: Text(
                'Malaria Typhoid | Emergency Lvl: Low',
                style: TextStyle(fontSize: 12),
                softWrap: false,
              ),
              subtitle: Text(
                'Dr. Amanda Lorems',
              ),
              trailing: Text(
                '2020',
                style: TextStyle(fontSize: 12),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: Text(
                  'View all',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () => Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AllReportsScreen())),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _visits() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          constraints: BoxConstraints(
              maxHeight: MediaQuery.of(context).size.height / 2.5),
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              child: ListTile(
//              isThreeLine: true,
                leading: Card(
                  color: kTextFieldFillColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10.0, vertical: 8.0),
                    child: Column(
                      children: [
                        Text(
                          'Nov',
                          style: TextStyle(fontSize: 12),
                        ),
                        Text('09', style: TextStyle(fontSize: 12))
                      ],
                    ),
                  ),
                ),
                title: Text(
                  'Regular Checkup | Emergency Lvl: Low',
                  style: TextStyle(fontSize: 12),
                  softWrap: false,
                ),
                subtitle: Text(
                  'Dr. Amanda Lorems',
                ),
                trailing: Text(
                  '2020',
                  style: TextStyle(fontSize: 12),
                ),
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(
                      MaterialPageRoute(builder: (context) => AddVisits()));
                },
                child: Icon(Icons.add_box_outlined),
              ),
              Spacer(),
              GestureDetector(
                child: Text(
                  'View all',
                  style: TextStyle(decoration: TextDecoration.underline),
                ),
                onTap: () => Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => AllVisitsScreen())),
              )
            ],
          ),
        ),
      ],
    );
  }
}

//Widget header() {
//  return Padding(
//    padding: const EdgeInsets.all(24.0),
//    child: Column(
//      children: [
//        Row(
//          children: [
//            Icon(
//              Icons.arrow_back_ios,
//              color: Colors.black,
//            ),
//            Spacer(),
//            Icon(
//              Icons.edit,
//              color: Colors.black,
//            ),
//          ],
//        ),
//      ],
//    ),
//  );
//}

class PatientDetail extends StatelessWidget {
  final String title;
  final String description;

  PatientDetail({Key key, this.title, this.description}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("$title:", style: kLabelText),
          Text(
            "  $description",
            style: kLabelText2,
          )
        ],
      ),
    );
  }
}

String validateNotEmpty(String value) =>
    value.isEmpty ? 'Field cannot be empty' : null;
