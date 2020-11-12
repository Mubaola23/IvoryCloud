import '../core/utilities/notifier.dart';
import '../models/failure.dart';
import '../models/patient.dart';
import '../services/patient_service.dart';

class AddPatientViewModel extends Notifier {
  final _patientService = PatientService();

  Future addPatient(Patient patient) async {
    setState(NotifierState.loading);

    try {
      await _patientService.createPatientWithId(patient);
      setError(null);
    } on Failure catch (err) {
      setError(err);
    }

    setState(NotifierState.loaded);
  }
}
