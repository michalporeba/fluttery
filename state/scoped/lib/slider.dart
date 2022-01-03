import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'model.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => ScopedModelDescendant<MyModel>(
      builder: (context, child, model) => Slider(
            value: model.size,
            onChanged: (value) => model.size = value
        )
    );
}
