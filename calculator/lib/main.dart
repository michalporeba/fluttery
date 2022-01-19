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
          child: Column(
            children: const [
              History(),
              CurrentDisplay(),
              SimpleKeyboard(),
              Padding(padding: EdgeInsets.all(padding),)
            ]
          ),
        )
      ),
    );
  }
}

class History extends StatelessWidget {
  final List<String> elements = const <String>[
    '= 345', '+345.00', '0', '123.00', '234'
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



class CurrentDisplay extends StatelessWidget {
  const CurrentDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(padding),
      child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.grey
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



class SimpleKeyboard extends StatelessWidget {
  const SimpleKeyboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(padding),
            crossAxisCount: 4,
            crossAxisSpacing: padding/2,
            mainAxisSpacing: padding/2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.3,
            children: const [
              OperationButton(label: Icons.help_outline),OperationButton(label: Icons.add),OperationButton(label: Icons.add),OperationButton(label: Icons.backspace),
              NumberButton(label: '7'),NumberButton(label: '8'),NumberButton(label: '9'),OperationButton(label: Icons.add),
              NumberButton(label: '4'),NumberButton(label: '5'),NumberButton(label: '6'),OperationButton(label: Icons.multiply),
              NumberButton(label: '1'),NumberButton(label: '2'),NumberButton(label: '3'),OperationButton(label: Icons.remove),
              NumberButton(label: '0'),NumberButton(label: '.'),OperationButton(label: Icons.equalizer),OperationButton(label: Icons.add)
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
        child: Text(label, style: Theme.of(context).textTheme.headline2)
    );
  }
}

class OperationButton extends StatelessWidget {
  final IconData label;

  const OperationButton({required this.label, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => true,
        child: Icon(label, size: 36, color: Colors.black)
    );
  }
}