import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';
import 'package:audioplayers/audioplayers.dart';

class State {
  final bool showLabels;
  const State({this.showLabels = true});
  State flip() => State(showLabels: !showLabels);
}

class StateCubit extends Cubit<State> {
  StateCubit() : super(const State());
  void flipShowLabels() => emit(state.flip());
}

void main() {
  runApp(BlocProvider(
    create: (_) => StateCubit(),
    child: const MyApp()
  ));
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
            RainbowBit(color: Colors.red, name: 'red', sound: 'note1.wav'),
            RainbowBit(color: Colors.orange, name: 'orange', sound: 'note2.wav'),
            RainbowBit(color: Colors.yellow, name: 'yellow', sound: 'note3.wav'),
            RainbowBit(color: Colors.green, name: 'green', sound: 'note4.wav'),
            RainbowBit(color: Colors.blue, name: 'blue', sound: 'note5.wav'),
            RainbowBit(color: Colors.indigo, name: 'indigo', sound: 'note6.wav'),
            RainbowBit(color: Colors.deepPurple, name: 'purple', sound: 'note7.wav')
          ]
        ),
      floatingActionButton: BlocBuilder<StateCubit, State>(
        builder: (context, model) {
          return FloatingActionButton(
              onPressed: () => context.read<StateCubit>().flipShowLabels(),
              child: Icon(model.showLabels ? Icons.font_download : Icons.clear)
          );
        }
      )
    );
  }
}

class RainbowBit extends StatelessWidget {
  final Color color;
  final String name;
  final String sound;

  const RainbowBit({
    required this.color,
    required this.name,
    required this.sound,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateCubit, State>(
        builder: (context, model) {
          return Expanded(
              child: GestureDetector(
                onTap: () async {
                  final AudioPlayer audioPlayer = AudioPlayer();
                  audioPlayer.setVolume(1);
                  sleep(const Duration(milliseconds: 100));
                  print(sound);
                  audioPlayer.onPlayerError(() {

                  })
                  int result = await audioPlayer.play('assets/$sound', isLocal: true);
                  if (result == 1) {
                    print('done');
                  }
                },
                child: DecoratedBox(
                    decoration: BoxDecoration(color: color),
                    child: model.showLabels
                      ? Container() : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 24),
                        child: Row(
                            children: [
                              OutlinedButton(onPressed: null,
                                  style: ButtonStyle(
                                      shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0))),
                                      backgroundColor: MaterialStateColor.resolveWith((states) => Theme.of(context).primaryColor)
                                  ),
                                  child: Text(name, style: Theme.of(context).textTheme.headline5)),
                            ]
                        )
                    )
                ),
              )
          );
        }
    );
  }
}
