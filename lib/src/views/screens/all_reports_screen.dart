import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/screens/patient_screen.dart';
import 'package:flutter/material.dart';

class AllReportsScreen extends StatefulWidget {
  @override
  _AllReportsScreenState createState() => _AllReportsScreenState();
}

class _AllReportsScreenState extends State<AllReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => PatientScreen())),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
//              onTap: () => Navigator.of(context).push(
//                  MaterialPageRoute(builder: (context) => PatientScreen())),
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last 1 Month",
                    style: kHeadingText,
                  ),
                  _reports(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Last 5 Month",
                    style: kHeadingText,
                  ),
                  _reports(),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Over 1 Year",
                    style: kHeadingText,
                  ),
                  _reports(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
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
        ),
      ],
    );
  }
}
