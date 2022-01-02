import 'package:flutter/material.dart';
import 'chart.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  var _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return Slider(
      value: _value,
      onChanged: _valueChanged
    );
  }

  void _valueChanged(double value) {
    setState(() { _value = value; });
    chartState.setValue(value);
  }
}
