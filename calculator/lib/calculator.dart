import 'package:flutter/material.dart';
import 'defaults.dart';
import 'display.dart';
import 'history.dart';
import 'keyboard.dart';

// key components laid out for the landscape orientation
class HorizontalView extends StatelessWidget {
  const HorizontalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  => Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Expanded(
          child: Column (
              children: const [
                History(),
                Display(),
              ]
          ),
        ),
        const Expanded(child: Keyboard())
      ]);
}

// key components laid out for the portrait orientation
class VerticalView extends StatelessWidget {
  const VerticalView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context)
  => Column(
      children: const [
        History(),
        Display(),
        Keyboard(),
      ]);
}

class CalculatorPage extends StatelessWidget {
  final String title;

  const CalculatorPage({
    required this.title,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title),),
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(padding),
            // a bit of UI logic to react to change in orientation
            child: OrientationBuilder(
                builder: (context, orientation)
                => (orientation == Orientation.portrait)
                    ? const VerticalView()
                    : const HorizontalView()
            ),
          )
      ),
    );
  }
}