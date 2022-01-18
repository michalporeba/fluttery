import 'package:base/redux.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'redux.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreBuilder<MyState>(
        onInit: (store) => store.dispatch(const SetSizeAction(0.5)),
        builder: (context, store) {
          return Slider(
              value: store.state.size,
              onChanged: (value) => store.dispatch(SetSizeAction(value))
          );
        },
    );
  }
}
