import 'package:flutter/material.dart';

class Countprovider with ChangeNotifier {
  int _count = 1;
  int get count => _count;
  void incrementcount() {
    _count++;
    notifyListeners();
  }
}
