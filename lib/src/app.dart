import 'package:IvoryCloud/src/core/constants.dart';
import 'package:IvoryCloud/src/views/screens/add_patient_screen.dart';
import 'package:IvoryCloud/src/views/screens/home_screen.dart';
import 'package:IvoryCloud/src/views/screens/splash_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ivory Cloud',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
