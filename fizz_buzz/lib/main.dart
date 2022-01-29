import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_) => ValueBloc()),
      BlocProvider(create: (_) => FizzBloc()),
      BlocProvider(create: (_) => BuzzBloc())
    ],
    child: MultiBlocListener(
        listeners: [
         
        ],
        child: const MyApp())
  ));
}


abstract class ValueEvent {
  const ValueEvent();
  int modify(int state);
}

class IncrementValue extends ValueEvent {
  @override
  int modify(int state) => state+1;
}

class SetValue extends ValueEvent {
  final int value;
  const SetValue(this.value);
  @override
  int modify(int state) => value;
}

class CounterState {
  final bool isOn;
  final int count;
  const CounterState(this.isOn, this.count);
}

abstract class CounterEvent {
  const CounterEvent();
  CounterState modify(CounterState state);
}

class TurnOn extends CounterEvent {
  @override
  CounterState modify(CounterState state) => CounterState(true, state.count);
}

class TurnOff extends CounterEvent {
  @override
  CounterState modify(CounterState state) => CounterState(false, state.count);
}

class ValueBloc extends Bloc<ValueEvent, int> {
  ValueBloc(): super(0) {
    on<ValueEvent>((event, emit) => emit(event.modify(state)));
  }
}

class FizzBloc extends Bloc<CounterEvent, CounterState> {
  FizzBloc(): super(const CounterState(false, 0)) {
    on<CounterEvent>((event, emit) => emit(event.modify(state)));
  }
}

class BuzzBloc extends Bloc<CounterEvent, CounterState> {
  BuzzBloc(): super(const CounterState(false, 0)) {
    on<CounterEvent>((event, emit) => emit(event.modify(state)));
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Streaming Fizz Buzz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            Display()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<ValueBloc>().add(IncrementValue()),
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Display extends StatelessWidget {
  const Display({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: const [
            FizzDisplay(),
            ValueDisplay(),
            BuzzDisplay(),
          ]
        );
  }
}

class FizzDisplay extends StatelessWidget {
  const FizzDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Fizz', style: Theme.of(context).textTheme.headline2);
  }
}

class BuzzDisplay extends StatelessWidget {
  const BuzzDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text('Buzz', style: Theme.of(context).textTheme.headline2);
  }
}

class ValueDisplay extends StatelessWidget {
  const ValueDisplay({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ValueBloc, int>(
        builder: (context, state) {
          return Text(state.toString(), style: Theme
              .of(context)
              .textTheme
              .headline2);
      }
    );
  }
}