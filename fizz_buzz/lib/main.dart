import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

void main() {
  runApp(BlocProvider(
    create: (_) => ValueBloc(),
    child: const MyApp()
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

class ValueBloc extends Bloc<ValueEvent, int> {
  ValueBloc(): super(0) {
    on<ValueEvent>((event, emit) => emit(event.modify(state)));
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
    return BlocBuilder<ValueBloc, int>(
      builder: (context, state) {
        return Row(
          children: [Text(state.toString())]
        );
      }
    );
  }
}

