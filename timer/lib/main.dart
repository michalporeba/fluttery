import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:timer/timer.dart';
import './main.dart';
import './timermodel.dart';

void main() => runApp(const MyApp());

const double defaultPadding = 5.0;

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Work Timer',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey
      ),
      home: Home()
    );
  }
}

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);

  final CountDownTimer timer = CountDownTimer();

  @override
  Widget build(BuildContext context) {
    timer.startWork();

    return Scaffold(
        appBar: AppBar(title: const Text('My Timer')),
        body: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints constraints) {
            final double availableWidth = constraints.maxWidth;
            return Center(
              child: Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const Padding(
                              padding: EdgeInsets.all(defaultPadding)),
                          Expanded(child: ProductivityButton(
                              color: const Color(0xff009688),
                              text: 'Work',
                              onPressed: doNothing)),
                          const Padding(
                              padding: EdgeInsets.all(defaultPadding)),
                          Expanded(child: ProductivityButton(
                              color: const Color(0xff607D8B),
                              text: 'Short Break',
                              onPressed: doNothing)),
                          const Padding(
                              padding: EdgeInsets.all(defaultPadding)),
                          Expanded(child: ProductivityButton(
                              color: const Color(0xff455a64),
                              text: 'Long Break',
                              onPressed: doNothing)),
                          const Padding(
                              padding: EdgeInsets.all(defaultPadding)),
                        ]
                    ),
                    Expanded(
                        child: StreamBuilder(
                            initialData: '00:00',
                            stream: timer.stream(),
                            builder: (BuildContext context, AsyncSnapshot snapshot) {
                              TimerModel timer = (snapshot.data == '00:00') ? TimerModel('00:00', 1) : snapshot.data;
                              return CircularPercentIndicator(
                                radius: availableWidth / 2,
                                lineWidth: availableWidth / 20,
                                percent: timer.percent,
                                center: Text(timer.time, style: Theme
                                    .of(context)
                                    .textTheme
                                    .headline4),
                                progressColor: const Color(0xff009688),
                              );
                            }
                          )
                        ),
                    Row(
                      children: [
                          const Padding(
                          padding: EdgeInsets.all(defaultPadding)),
                          Expanded(child: ProductivityButton(
                          color: const Color(0xff212121),
                          text: 'Stop',
                          onPressed: doNothing)),
                          const Padding
                        (
                          padding: EdgeInsets.all(defaultPadding)),
                      Expanded(child: ProductivityButton(
                          color: const Color(0xff009688),
                          text: 'Restart',
                          onPressed: doNothing)),
                      const Padding(
                          padding: EdgeInsets.all(defaultPadding)),
                      ]
                    ),
                    Container(
                        color: Colors.blueGrey,
                        child: const SizedBox(height: 30,)
                    ),
                  ]
              ),
            );
          }
        )
    );
  }

  void doNothing() {}
}

class ProductivityButton extends StatelessWidget {
  final Color color;
  final String text;
  final VoidCallback onPressed;

  ProductivityButton({
    required this.color,
    required this.text,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        onPressed: onPressed,
        color: color,
        child: Text(text, style: const TextStyle(color: Colors.white)),
    );
  }
}
