import 'package:flutter/material.dart';

class ProviderContainer with ChangeNotifier {
  double _value = 1.0;
  double get value => _value;
  void setvalue(double val) {
    _value = val;
    notifyListeners();
  }
}
