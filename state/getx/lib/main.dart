import 'package:flutter/material.dart';
import 'chart.dart';
import 'slider.dart';
import 'controller.dart';
import 'package:get/get.dart';

void main() {
  runApp(const SampleStateApp());
}

class SampleStateApp extends StatelessWidget {
  const SampleStateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Experiments with state',
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Controller c = Get.put(Controller());

    return Scaffold(
        appBar: AppBar(title: const Text('managing state - Get X')),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('from Google I/O 2019 demo',
                style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text('Pragmatic State Management in Flutter',
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent)),
              ),
              Expanded(child: Padding(
                padding: const EdgeInsets.all(32),
                child: MyChart()
              )),
              Padding(
                padding: const EdgeInsets.all(32),
                child: MySlider()
              )
            ]
          )
        )
    );
  }
}
