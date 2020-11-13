import 'package:IvoryCloud/src/views/screens/home_screen.dart';
import 'package:IvoryCloud/src/views/screens/login_screen.dart';
import 'package:flutter/material.dart';

import 'core/constants.dart';
import 'views/screens/splash_screen.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Ivory Cloud',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomeScreen(),
    );
  }
}
