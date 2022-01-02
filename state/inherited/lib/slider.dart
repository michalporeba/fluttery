import 'package:flutter/material.dart';
import 'model.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    HomeState state = HomeModel.of(context);
    return Slider(
        value: state.size,
        onChanged: (value) => { state.size = value }
    );
  }
}
