import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/screens/add_patient_screen.dart';
import 'package:IvoryCloud/src/views/screens/patient_screen.dart';
import 'package:IvoryCloud/src/views/widgets/paginator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Patient {
  final String serialNo;
  final String patientId;
  final String name;

  Patient({this.serialNo, this.patientId, this.name});
}

List<Patient> patients = <Patient>[
  Patient(
    name: 'Jamiu Okanlawwon',
    patientId: '1234001',
    serialNo: '001',
  ),
  Patient(
    name: 'Ridwan Oriola',
    patientId: '1234002',
    serialNo: '002',
  ),
  Patient(
    name: 'Qoyyum Alabi',
    patientId: '1234003',
    serialNo: '003',
  ),
  Patient(
    name: 'Salwat Ashake',
    patientId: '1234004',
    serialNo: '004',
  )
];

class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion(
      value: SystemUiOverlayStyle(statusBarColor: Colors.transparent),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header(context),
            Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Expanded(
                      child: DataTable(
                        columns: const <DataColumn>[
                          DataColumn(label: Text('S/N')),
                          DataColumn(label: Text('Patient ID')),
                          DataColumn(label: Text('Name')),
                        ],
                        rows: patients
                            .map((patient) => DataRow(
                                  cells: <DataCell>[
                                    DataCell(GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PatientScreen()));
                                        },
                                        child: Text(patient.serialNo))),
                                    DataCell(GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PatientScreen()));
                                        },
                                        child: Text(patient.patientId))),
                                    DataCell(GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      PatientScreen()));
                                        },
                                        child: Text(patient.name))),
                                  ],
                                ))
                            .toList(),
                      ),
                    ),
                    Paginator(
                      selectedPage: 6,
                      onItemTapped: (index) {
                        print(index);
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(context) => Container(
        padding: EdgeInsets.all(24),
        decoration: BoxDecoration(
          color: kPrimaryColor,
          borderRadius: BorderRadius.only(
            bottomRight: Radius.circular(36),
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Row(
                children: [
                  CircleAvatar(),
                  SizedBox(width: 12.0),
                  Text(
                    'Lorem Ipsum',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                  Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => AddPatientScreen())),
                    child: Icon(
                      Icons.add_box_outlined,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(width: 12.0),
                  Icon(
                    Icons.filter_alt_outlined,
                    color: Colors.white,
                  ),
                ],
              ),
              SizedBox(height: 10.0),
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut ',
                style: TextStyle(
                  fontSize: 18,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      );
}
