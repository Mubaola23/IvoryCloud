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
        name: "Another Hospital",
        desc: "Name here",
        imgPath: "",
      ),
      HospitalModel(
        name: "Another Hospital",
        desc: "Name here",
        imgPath: "",
      ),
      HospitalModel(
        name: "Ivory Med",
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
