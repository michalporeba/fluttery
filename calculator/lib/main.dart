import 'package:flutter/material.dart';
import 'calculator.dart';

void main() {
  // the flutter startup point
  // any startup configuration
  // can be added here
  runApp(const Calculator());
}

class Calculator extends StatelessWidget {
  const Calculator({Key? key}) : super(key: key);

  // This widget is the root of the application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator UI',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: Theme.of(context).textTheme.copyWith(
          headline4: Theme.of(context).textTheme.headline4?.copyWith(
            fontSize: 24
          )
        )
      ),
      home: const CalculatorPage(title: 'Calculator'),
    );
  }
}