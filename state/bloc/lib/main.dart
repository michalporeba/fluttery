import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'chart.dart';
import 'slider.dart';
import 'model.dart';

void main() {
  runApp(const SampleStateApp());
}

class SampleStateApp extends StatelessWidget {
  const SampleStateApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Experiments with state',
      home: BlocProvider(
        create: (_) => SizeCubit(),
        child: const Home()
      )
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('managing state - BLoC')),
        body: Center(
          child: Column(
            children: const [
              Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('from Google I/O 2019 demo',
                style: TextStyle(fontSize: 24, color: Colors.blueGrey)),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text('Pragmatic State Management in Flutter',
                    style: TextStyle(fontSize: 17, color: Colors.blueAccent)),
              ),
              Expanded(child: Padding(
                padding: EdgeInsets.all(32),
                child: MyChart()
              )),
              Padding(
                padding: EdgeInsets.all(32),
                child: MySlider()
              )
            ]
          )
        )
    );
  }
}
