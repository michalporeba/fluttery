import 'package:scoped_model/scoped_model.dart';

class MyModel extends Model {
  double _size = 0.0;

  double get size => _size;

  set size(double value) {
    _size = value;
    notifyListeners();
  }
}