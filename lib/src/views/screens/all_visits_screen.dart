import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/screens/add_visits.dart';
import 'package:IvoryCloud/src/views/screens/single_visit_screen.dart';
import 'package:flutter/material.dart';

class AllVisitsScreen extends StatefulWidget {
  @override
  _AllVisitsScreenState createState() => _AllVisitsScreenState();
}

class _AllVisitsScreenState extends State<AllVisitsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => AddVisits()));
              },
              child: Icon(
                Icons.add_box_outlined,
                color: Colors.black,
              ),
            ),
          ),
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, right: 16),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Visits",
                style: kHeadingText,
              ),
              _visits(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _visits() {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height / 1),
            margin: EdgeInsets.only(top: 16),
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: 10,
              itemBuilder: (context, index) => Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(36),
                  border: Border.all(color: Colors.black, width: 3),
                ),
                margin: EdgeInsets.only(top: 16),
                child: Row(children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: kTextFieldFillColor,
                  ),
                  kSmallHorizontalSpacing,
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Damian Delphino Frust',
                        softWrap: true,
                        style: kHeadingText,
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Date of Visit: ',
                          style: kLabelText,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 9th September 2020',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          text: 'Time of Visit: ',
                          style: kLabelText,
                          children: <TextSpan>[
                            TextSpan(
                              text: ' 9am',
                              style: TextStyle(fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => SingleVisitScreen()));
                        },
                        child: Text(
                          'Tap to View More',
                          style: TextStyle(fontWeight: FontWeight.w200),
                        ),
                      ),
                    ],
                  ),
                ]),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
