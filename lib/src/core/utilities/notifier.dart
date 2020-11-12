import 'package:flutter/foundation.dart';

import '../../models/failure.dart';

enum NotifierState { initial, loading, loaded }

class Notifier with ChangeNotifier {
  NotifierState _state = NotifierState.initial;

  NotifierState get state => _state;

  void setState(NotifierState state) {
    _state = state;
    notifyListeners();
  }

  Failure _error;

  Failure get error => _error;

  void setError(Failure error) {
    _error = error;
    notifyListeners();
  }
}
