import 'package:flutter/material.dart';

class HomeModel extends InheritedNotifier<HomeState> {
  HomeModel({
    Key? key,
    required HomeState notifier,
    required child
  }) : super(key: key, notifier: notifier, child: child);

  HomeState state = HomeState();

  @override
  bool updateShouldNotify(covariant HomeModel oldWidget)
  => state.size != oldWidget.state.size;

  static HomeState of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<HomeModel>()?.notifier
      ?? HomeState();
  }
}

class HomeState extends ChangeNotifier {
  double _size = 0.0;
  HomeState();

  double get size => _size;
  set size(double value) {
    _size = value;
    notifyListeners();
  }
}