import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

const double padding = 12.0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SimpleCalculatorPage(title: 'Calculator'),
    );
  }
}

class SimpleCalculatorPage extends StatelessWidget {
  final String title;

  const SimpleCalculatorPage({
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
          child: OrientationBuilder(
            builder: (context, orientation) {
              if (orientation == Orientation.portrait) {
                return Column
                  (
                    children: const [
                      History(),
                      Display(),
                      Keyboard(),
                    ]
                );
              } else {
                return Row(
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
                  ]
                );
              }
            }
          ),
        )
      ),
    );
  }
}

class History extends StatelessWidget {
  final List<String> elements = const <String>[
    '= 42.00', '- 114.89', '= 156.89', '+ 123.45', '33.44'
  ];

  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(padding),
        child: ListView.builder(
          reverse: true,
          itemCount: elements.length,
          itemBuilder: (context, index) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [HistoryItem(value: elements[index])]
            );
          }
        ),
      ),
    );
  }
}

class HistoryItem extends StatelessWidget {
  final String value;
  const HistoryItem({
    required this.value,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding, vertical: padding/2),
      child: Text(value, style: const TextStyle(fontSize: 24, color: Colors.grey)),
    );
  }
}



class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: DecoratedBox(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.all(Radius.circular(8)),
              border: Border.all(color: Colors.blueAccent, width: 2.0, style: BorderStyle.solid)
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(padding),
                  child: Text('123,456.78',
                      overflow: TextOverflow.fade,
                      style: Theme.of(context).textTheme.headline2
                  ),
                ) ]
          )
      ),
    );
  }
}



class Keyboard extends StatelessWidget {
  const Keyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double ratio = 1.3;
    if (MediaQuery.of(context).orientation == Orientation.landscape) {
      Rect bounds = context.findRenderObject()?.paintBounds ?? Rect.zero;
      ratio = bounds.width / (bounds.height - padding*6);
    }

    return SizedBox(
      child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(padding),
            crossAxisCount: 4,
            crossAxisSpacing: padding/2,
            mainAxisSpacing: padding/2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: ratio > 0 ? ratio : 1.3,
            children: [
              const OperationButton(label: Icons.help_outline, highlight: true,),
              OperationButton(label: 'x'+String.fromCharCode(0x207f)),
              OperationButton(label: String.fromCharCode(0x221A)),
              const OperationButton(label: Icons.backspace, highlight: true,),

              const NumberButton(label: '7'),
              const NumberButton(label: '8'),
              const NumberButton(label: '9'),
              OperationButton(label: String.fromCharCode(0x00f7)),

              const NumberButton(label: '4'),
              const NumberButton(label: '5'),
              const NumberButton(label: '6'),
              const OperationButton(label: Icons.clear),

              const NumberButton(label: '1'),
              const NumberButton(label: '2'),
              const NumberButton(label: '3'),
              const OperationButton(label: Icons.add),

              const NumberButton(label: '0'),
              const NumberButton(label: '.'),
              const OperationButton(label: '='),
              const OperationButton(label: Icons.remove)
            ]
        ),
    );
  }
}


class NumberButton extends StatelessWidget {
  final String label;

  const NumberButton({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => true,
        child: Text(label, style: const TextStyle(color: Colors.black54, fontSize: 48))
    );
  }
}

class OperationButton extends StatelessWidget {
  final Object label;
  final bool highlight;

  const OperationButton({
    required this.label,
    this.highlight = false,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        child: _createLabel(label)
    );
  }

  Widget _createLabel(Object label) {
    if (label is IconData) {
      return Icon(label, size: 40, color: highlight? Colors.deepOrange : Colors.black54);
    } else {
      return Text(label as String, style: const TextStyle(color: Colors.black54, fontSize: 40));
    }
    return Container();
  }
}