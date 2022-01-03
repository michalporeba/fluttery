import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'model.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
    => Consumer<MyModel>(
      builder: (context, model, child)
          => Slider(
            value: model.size,
            onChanged: (value) => model.size = value
          )
    );
}