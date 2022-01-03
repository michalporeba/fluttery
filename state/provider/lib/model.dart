import 'package:flutter/material.dart';

class MyModel extends ChangeNotifier {
  double _size = 0.0;
  double get size => _size;
  set size(double value) {
    _size = value;
    notifyListeners();
  }
}