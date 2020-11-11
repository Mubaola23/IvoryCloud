import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../core/constants.dart';
import '../../core/images.dart';
import '../models/hospital_model.dart';

class HospitalScreen extends StatefulWidget {
  @override
  _HospitalScreenState createState() => _HospitalScreenState();
}

class _HospitalScreenState extends State<HospitalScreen> {
  List<HospitalModel> hospitalList = HospitalModel.list;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kPrimaryColor,
        body: ListView(children: <Widget>[
          Container(
            margin: EdgeInsets.all(30),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Column(
                children: <Widget>[
                  Container(
                      alignment: Alignment.center,
                      child: SvgPicture.asset(
                        logo,
                        height: 50,
                      )),
                  SizedBox(
                    height: 30,
                  ),
                  Text(
                    "Welcome to IvoryCloud",
                    style: TextStyle(color: Colors.white, fontSize: 30),
                  ),
                  Text(
                    "select a hospital",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  )
                  
                ],
              ),
            ),
          ),    
          Container(
            height: MediaQuery.of(context).size.height * 0.5,
            margin: EdgeInsets.only(left: 30, right: 30),
            child: ListView.builder(
                itemCount: 3,
                //scrollDirection: Axis.horizontal,
                physics: BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.of(context)
                          .push(MaterialPageRoute(builder: (_) => null));
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20.0),
                      child: buildContainer(index, 300),
                    ),
                  );
                }),
          ),
         // SizedBox(height: 30),
          Icon(Icons.arrow_forward, color: Colors.grey[50], size: 30.0),
          kSmallVerticalSpacing,
          Padding(
            padding: const EdgeInsets.only(right: 60),
            child: Text("REGISTER YOUR HOSPITAL", textAlign: TextAlign.end,
            style: TextStyle(
            decoration:TextDecoration.underline,
            decorationColor: Colors.white,
            color: Colors.white,
            fontSize: 16,
          ),),
          ),  
        ]
      )
    );
  }

  Widget buildContainer(int index, double width) {
    return Container(
      height: 90,
      width: width,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          children: <Widget>[
            Container(height: 60, width: 60,
            decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.all(Radius.circular(20))),),
          SizedBox(width: 16,),
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text("${hospitalList[index].name}",
                    style: TextStyle(color: Colors.black)),
                    SizedBox(height: 8,),
                Text("${hospitalList[index].desc}",
                    style: TextStyle(color: Colors.black)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
