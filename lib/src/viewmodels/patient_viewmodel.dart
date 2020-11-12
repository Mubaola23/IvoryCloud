import '../core/utilities/notifier.dart';
import '../models/failure.dart';
import '../models/patient.dart';
import '../services/patient_service.dart';

class PatientViewModel extends Notifier {
  final _patientService = PatientService();

  List<Patient> _patients;
  List<Patient> get patients => _patients;

  void _setPatients(List<Patient> patients) {
    _patients = patients;
    notifyListeners();
  }

  Future getAllPatients() async {
    setState(NotifierState.loading);

    try {
      final patientResponse = await _patientService.getAllPatients();
      _setPatients(patientResponse);
      setError(null);
    } on Failure catch (err) {
      setError(err);
    }

    setState(NotifierState.loaded);
  }
}
