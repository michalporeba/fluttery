import 'package:base/model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MySlider extends ConsumerWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    MyModel state = ref.watch(stateProvider);
    return Slider(
            value: state.size,
            onChanged: (value) => ref.read(stateProvider.notifier).set(value)
      );
  }

}