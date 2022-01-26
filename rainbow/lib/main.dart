import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

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
            RainbowBit(color: Colors.red, name: 'red'),
            RainbowBit(color: Colors.orange, name: 'orange'),
            RainbowBit(color: Colors.yellow, name: 'yellow'),
            RainbowBit(color: Colors.green, name: 'green'),
            RainbowBit(color: Colors.blue, name: 'blue'),
            RainbowBit(color: Colors.indigo, name: 'indigo'),
            RainbowBit(color: Colors.deepPurple, name: 'purple')
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

  const RainbowBit({
    required this.color,
    required this.name,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<StateCubit, State>(
        builder: (context, model) {
          return Expanded(
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
              )
          );
        }
    );
  }
}
