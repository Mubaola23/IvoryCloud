import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Patient {
  final String id;
  final String patientNumber;
  final String fullName;
  final int age;
  final String maritalStatus;
  final String gender;
  final String lga;
  final String state;
  final String homeAddress;
  final String phoneNumber;
  final String emailAddress;
  final String nextOfKin;
  final String comment;
  final String symptom;
  final String patientType;
  final String passport;
  final String timestamp;

  Patient({
    this.id,
    this.patientNumber,
    @required this.fullName,
    @required this.age,
    @required this.maritalStatus,
    @required this.gender,
    @required this.lga,
    @required this.state,
    @required this.homeAddress,
    @required this.phoneNumber,
    @required this.emailAddress,
    @required this.nextOfKin,
    @required this.comment,
    @required this.symptom,
    @required this.patientType,
    @required this.passport,
    @required this.timestamp,
  });

  factory Patient.fromDocumentSnapshot(QueryDocumentSnapshot snapshot) =>
      Patient(
        id: snapshot.id,
        patientNumber: snapshot.data()['patientNumber'] ?? '',
        fullName: snapshot.data()['fullName'] ?? '',
        age: snapshot.data()['age'] ?? '',
        maritalStatus: snapshot.data()['maritalStatus'] ?? '',
        gender: snapshot.data()['gender'] ?? '',
        lga: snapshot.data()['lga'] ?? '',
        state: snapshot.data()['state'] ?? '',
        homeAddress: snapshot.data()['homeAddress'] ?? '',
        phoneNumber: snapshot.data()['phoneNumber'] ?? '',
        emailAddress: snapshot.data()['emailAddress'] ?? '',
        nextOfKin: snapshot.data()['nextOfKin'] ?? '',
        comment: snapshot.data()['comment'] ?? '',
        patientType: snapshot.data()['patientType'] ?? '',
        passport: snapshot.data()['passport'] ?? '',
        symptom: snapshot.data()['symptom'] ?? '',
        timestamp: snapshot.data()['timestamp'] ?? '',
      );
}
