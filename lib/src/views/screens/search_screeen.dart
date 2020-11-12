import 'package:flutter/material.dart';

import '../../core/constants.dart';
import '../widgets/app_text_field.dart';
import '../widgets/paginator.dart';
import 'dashboard_screen.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(top: 24),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  searchSwitch(
                    text: "Name",
                    onpressed: () {},
                  ),
                  kTinyHorizontalSpacing,
                  searchSwitch(
                    text: "ID",
                    onpressed: () {},
                  )
                ],
              ),
              kSmallVerticalSpacing,
              _searchField(),
              kSmallVerticalSpacing,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Recent Search',
                    style: kHeadingText,
                  )
                ],
              ),
              Expanded(
                child: Card(
                  margin: EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 0.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      // Expanded(
                      //   child: DataTable(
                      //     columns: const <DataColumn>[
                      //       DataColumn(label: Text('S/N')),
                      //       DataColumn(label: Text('Patient ID')),
                      //       DataColumn(label: Text('Name')),
                      //     ],
                      //     rows: patients
                      //         .map((patient) => DataRow(
                      //               cells: <DataCell>[
                      //                 DataCell(Text(patient.serialNo)),
                      //                 DataCell(Text(patient.patientId)),
                      //                 DataCell(Text(patient.name)),
                      //               ],
                      //             ))
                      //         .toList(),
                      //   ),
                      // ),
                      Paginator(
                        selectedPage: 1,
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
      ),
    );
  }
}

class searchSwitch extends StatelessWidget {
  final String text;
  final Function onpressed;

  const searchSwitch({
    Key key,
    @required this.text,
    this.onpressed,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32.0, vertical: 12.0),
      width: MediaQuery.of(context).size.width / 3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.0),
        color: kTextFieldFillColor,
      ),
      child: Text(
        text,
        textAlign: TextAlign.center,
      ),
    );
  }
}

Widget _searchField() {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 24.0),
    child: AppTextField(
      keyboardType: TextInputType.text,
      textInputAction: TextInputAction.done,
      hintText: 'Search',
      filled: true,
      title: '',
      border: OutlineInputBorder(borderSide: BorderSide.none),
      prefixIcon: Icon(
        Icons.search,
        color: Colors.grey,
      ),
    ),
  );
}
