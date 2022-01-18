import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'chart.dart';
import 'slider.dart';
import 'redux.dart';

void main() {
  final store = Store<MyState>(myReducer, initialState: const MyState(size: 0.5));

  runApp(SampleStateApp(store: store));
}

class SampleStateApp extends StatelessWidget {
  final Store<MyState> store;
  const SampleStateApp({required this.store, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StoreProvider<MyState>(
      store: store,
      child: const MaterialApp(
        title: 'Experiments with state',
        home: Home()
      ),
    );
  }
}

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('managing state - Redux')),
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
