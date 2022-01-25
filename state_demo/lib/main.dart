import 'package:flutter/material.dart';

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
    return Scaffold(
        appBar: AppBar(title: const Text('state management sample')),
        body: Center(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(32.0),
                child: Text('00:00',
                style: TextStyle(fontSize: 32, color: Colors.blueGrey)),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(32),
                child: SizedBox(
                    width:50, height:50,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor
                    ),
                  )
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.all(32),
                child: Column(
                  children: [
                    const MySlider(),
                    const MySlider(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children:const [
                        ElevatedButton(onPressed: null, child: Text('red')),
                        ElevatedButton(onPressed: null, child: Text('green')),
                        ElevatedButton(onPressed: null, child: Text('blue'))
                      ]
                    )
                  ]
                )
              ),
              const Padding(
                  padding: EdgeInsets.all(32),

              )
            ]
          )
        )
    );
  }
}

class MySlider extends StatelessWidget {
  const MySlider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Slider(
        value: 0.5,
        onChanged: (value) {print(value);}
    );
  }
}
