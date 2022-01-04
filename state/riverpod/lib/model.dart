import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyModel {
  final double size;
  MyModel(this.size);
}

class MyStateNotifier extends StateNotifier<MyModel> {
  MyStateNotifier() : super(MyModel(0.5));
  void set(double value) {
    state = MyModel(value);
  }
}

final stateProvider = StateNotifierProvider<MyStateNotifier, MyModel>((ref) => MyStateNotifier());