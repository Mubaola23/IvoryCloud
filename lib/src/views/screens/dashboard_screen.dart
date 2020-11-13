import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../core/constants.dart';
import '../../core/utilities/notifier.dart';
import '../../viewmodels/patient_viewmodel.dart';
import 'add_patient_screen.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  int _rowPerPage = PaginatedDataTable.defaultRowsPerPage;

  void navigateToAddPatient() {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (_) => AddPatientScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<PatientViewModel>(
      create: (context) => PatientViewModel()..getAllPatients(),
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            header(context),
            Expanded(
              child: Card(
                margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                child: Consumer<PatientViewModel>(
                  builder: (context, patientViewModel, _) {
                    if (patientViewModel.state == NotifierState.loading) {
                      return Center(child: CircularProgressIndicator());
                    } else {
                      if (patientViewModel.error != null) {
                        print(patientViewModel.error);
                        return null;
                      } else {
                        if (patientViewModel.patients == []) {
                          return Center(
                            child: Text('No Patients Recorded'),
                          );
                        } else {
                          return patientsInfo(patientViewModel);
                        }
                      }
                    }
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget header(BuildContext context) => Container(
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

  Widget patientsInfo(PatientViewModel patientViewModel) {
    return SingleChildScrollView(
      child: PaginatedDataTable(
        header: Text('Patients'),
        columns: const <DataColumn>[
          DataColumn(label: Text('S/N')),
          DataColumn(label: Text('Patient ID')),
          DataColumn(label: Text('Name')),
        ],
        source: PatientDataSource(patientViewModel),
        rowsPerPage: _rowPerPage,
        actions: [
          GestureDetector(
            onTap: navigateToAddPatient,
            child: Icon(Icons.add_circle_outline),
          ),
          SizedBox(width: 8.0),
          Icon(
            Icons.filter_alt_outlined,
          ),
        ],
        onRowsPerPageChanged: (r) {
          setState(() {
            _rowPerPage = r;
          });
        },
      ),
    );
  }
}

class PatientDataSource extends DataTableSource {
  final PatientViewModel patientViewModel;

  PatientDataSource(this.patientViewModel);

  @override
  DataRow getRow(int index) {
    return DataRow.byIndex(index: index, cells: [
      DataCell(Text(patientViewModel.patients[index].id)),
      DataCell(Text(patientViewModel.patients[index].patientNumber)),
      DataCell(Text(patientViewModel.patients[index].fullName)),
    ]);
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => patientViewModel.patients.length;

  @override
  int get selectedRowCount => 0;
}
