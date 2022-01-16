import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';

class MySlider extends StatefulWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  _MySliderState createState() => _MySliderState();
}

class _MySliderState extends State<MySlider> {
  var _value = 0.5;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SizeCubit, double>(
      builder: (context, size) {
        return Slider(
            value: size,
            onChanged: (value) => context.read<SizeCubit>().setSize(value)
        );
      },
    );

  }

  void _valueChanged(double value) {
    setState(() { _value = value; });
  }
}
