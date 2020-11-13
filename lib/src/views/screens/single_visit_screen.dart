import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/widgets/app_button.dart';
import 'package:flutter/material.dart';

class SingleVisitScreen extends StatefulWidget {
  String name;
  @override
  _SingleVisitScreenState createState() => _SingleVisitScreenState();
}

class _SingleVisitScreenState extends State<SingleVisitScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Visit(),
            kMediumVerticalSpacing,
            AppButton(text: 'EDIT', onPressed: () {}),
          ],
        ),
      ),
    );
  }
}

class Visit extends StatelessWidget {
  String name = 'Damian Delphino Frust';
  String date = '9th September 2020';
  String time = '9am';
  String emergencyLevel = 'Low';
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 32.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              name,
              style: kHeadingText,
            ),
            kLargeVerticalSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 150,
                  decoration: BoxDecoration(
                      color: kTextFieldFillColor,
                      borderRadius: BorderRadius.circular(10)),
                ),
                kMediumHorizontalSpacing,
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text.rich(
                      TextSpan(
                        text: 'Date of Visit:\n',
                        style: kLabelText,
                        children: <TextSpan>[
                          TextSpan(
                            text: date,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    ),
                    kMediumVerticalSpacing,
                    Text.rich(
                      TextSpan(
                        text: 'Time of Visit:\n',
                        style: kLabelText,
                        children: <TextSpan>[
                          TextSpan(
                            text: time,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                    kMediumVerticalSpacing,
                    Text.rich(
                      TextSpan(
                        text: 'Emergency Level:\n',
                        style: kLabelText,
                        children: <TextSpan>[
                          TextSpan(
                            text: emergencyLevel,
                            style: TextStyle(fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
            kLargeVerticalSpacing,
            Divider(),
            kSmallVerticalSpacing,
            Text.rich(
              TextSpan(
                text: 'Doctor\'s Report :\n',
                style: kLabelText,
                children: <TextSpan>[
                  TextSpan(
                    text:
                        'Patient was Diagnosed with Malaria Type 2. Anti-malaria and Anti-biotic was presecribed. Patient was adviced to sleep for a minimum of 7hrs in a day inorder to help the drug prescribed have a faster effecton the patient.',
                    style: TextStyle(fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
            kLargeVerticalSpacing,
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text.rich(
                  TextSpan(
                    text: name[0],
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline),
                    children: <TextSpan>[
                      TextSpan(
                        text: name[1],
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                      TextSpan(
                        text: name[2],
                        style: TextStyle(fontWeight: FontWeight.w700),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
