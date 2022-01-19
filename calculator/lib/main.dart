import 'package:flutter/material.dart';

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
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: const [
              Spacer(),
              Text('previous operation 1'),
              Text('previous operation 2'),
              CurrentDisplay(),
              SimpleKeyboard(),
              Padding(padding: EdgeInsets.all(8),)
            ]
          ),
        )
      ),
    );
  }
}

class CurrentDisplay extends StatelessWidget {
  const CurrentDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: DecoratedBox(
          decoration: const BoxDecoration(
              color: Colors.grey
          ),
          child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text('123456',
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
            padding: const EdgeInsets.all(12),
            crossAxisCount: 4,
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            childAspectRatio: 1.2,
            children: const [
              CalculatorButton(),CalculatorButton(),CalculatorButton(),CalculatorButton(),
              CalculatorButton(),CalculatorButton(),CalculatorButton(),CalculatorButton(),
              CalculatorButton(),CalculatorButton(),CalculatorButton(),CalculatorButton(),
              CalculatorButton(),CalculatorButton(),CalculatorButton(),CalculatorButton()
            ]

        ),
    );
  }
}


class CalculatorButton extends StatelessWidget {
  const CalculatorButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: null,
        child: Text('?', style: Theme.of(context).textTheme.headline2)
    );
  }
}
