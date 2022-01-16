import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'model.dart';

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ModelCubit, Model>(
      builder: (context, model) {
        return Slider(
            value: model.size,
            onChanged: (value) => context.read<ModelCubit>().setSize(value)
        );
      },
    );
  }
}
