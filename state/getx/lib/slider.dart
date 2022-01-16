import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller.dart';

class MySlider extends StatelessWidget {
  MySlider({Key? key}) : super(key: key);

  final Controller c = Get.find();

  @override
  Widget build(BuildContext context) {
    return Obx(() => Slider(
        value: c.size.value,
        onChanged: (value) => c.size(value)
    ));
  }
}