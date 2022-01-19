import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.grey,
      ),
      home: const Rainbow(),
    );
  }
}

class Rainbow extends StatelessWidget {
  const Rainbow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Rainbow')),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            RainbowBit(color: Colors.red),
            RainbowBit(color: Colors.orange),
            RainbowBit(color: Colors.yellow),
            RainbowBit(color: Colors.green),
            RainbowBit(color: Colors.blue),
            RainbowBit(color: Colors.indigo),
            RainbowBit(color: Colors.deepPurple)
          ]
        ),
    );
  }
}

class RainbowBit extends StatelessWidget {
  final Color color;

  const RainbowBit({
    required this.color,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: DecoratedBox(
            decoration: BoxDecoration(color: color)
        )
    );
  }
}
