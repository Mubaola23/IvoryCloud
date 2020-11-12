import 'package:flutter/material.dart';

import '../../core/images.dart';
import '../../core/images.dart';

class HospitalModel {
  final String name;
  final String desc;
  final String imgPath;

  HospitalModel({
    this.name, 
    this.desc, 
    this.imgPath});

    static List<HospitalModel> list = [
      HospitalModel(
        name: "Ivory Med",
        desc: "Hospital",
        imgPath: onboarding3,
      ),
      HospitalModel(
        name: "Medothist lab",
        desc: "Private Hospital",
        imgPath: "",
      ),
      HospitalModel(
        name: "splash Med",
        desc: "New Hospital",
        imgPath: "",
      ),
      HospitalModel(
        name: "Icloud Med",
        desc: "Hospital",
        imgPath: onboarding2,
      ),
      HospitalModel(
        name: "Another Hospital",
        desc: "Name here",
        imgPath: "",
      ),
      HospitalModel(
        name: "Another Hospital",
        desc: "Name here",
        imgPath: "",
      ),
    ];
}
