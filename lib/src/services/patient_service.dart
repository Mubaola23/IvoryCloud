import 'package:cloud_firestore/cloud_firestore.dart';

import '../models/patient.dart';

class PatientService {
  final _patientCollection = FirebaseFirestore.instance.collection('patient');

  Future<List<Patient>> getAllPatients() async {
    List<Patient> patients = [];
    final snapshot = (await _patientCollection.get()).docs;
    snapshot.forEach(
      (patient) => patients.add(Patient.fromDocumentSnapshot(patient)),
    );
    return patients;
  }

  Future<void> createPatientWithId(Patient patient) async {
    final snapshotLength = (await _patientCollection.get()).docs.length;

    return await _patientCollection.doc('00${snapshotLength + 1}').set(
      {
        'patientNumber': '202000${snapshotLength + 1}',
        'fullName': patient.fullName,
        'age': patient.age,
        'maritalStatus': patient.maritalStatus,
        'gender': patient.gender,
        'lga': patient.lga,
        'state': patient.state,
        'homeAddress': patient.homeAddress,
        'phoneNumber': patient.phoneNumber,
        'emailAddress': patient.emailAddress,
        'nextOfKin': patient.nextOfKin,
        'comment': patient.comment,
        'patientType': patient.patientType,
        'passport': patient.passport,
        'timestamp': DateTime.now().toUtc().toString(),
      },
    );
  }

  // @override
  // Future<CardInfo> addCardInfo(CardParams params) async {
  //   String logoUrl = await _uploadLogo(params.logoImage, params.brandName);

  //   DocumentReference reference =
  //       await userCollection.doc(params.userId).collection("cards").add({
  //     'brandName': params.brandName,
  //     'fullName': params.fullName,
  //     'address': params.address,
  //     'emailAddress': params.emailAddress,
  //     'jobPosition': params.jobPosition,
  //     'logoUrl': logoUrl,
  //     'phoneNumber': params.phoneNumber,
  //     'socialOrWebLink': params.socialOrWebLink,
  //     'tagline': params.tagline,
  //   });
  //   DocumentSnapshot snapshot = await reference.get();

  //   return CardInfo.fromDocumentSnapshot(snapshot);
  // }
}
