import 'package:flutter/material.dart';

class FavoriteProvider with ChangeNotifier {
  final Set<int> _selectitems = {};
  Set get selectitems => _selectitems;
  void addlist(index) {
    if (_selectitems.contains(index)) {
      _selectitems.remove(index);
    } else {
      _selectitems.add(index);
    }
    notifyListeners();
  }
}
