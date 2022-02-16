import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'dart:convert';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Random Dog Image',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Future<String>? randomDogImage;
  final Client client = Client();


  void _getDogUrlFromWeb() async {
    print('getting the dog');
    var response = await client.get(Uri.https('dog.ceo', '/api/breeds/image/random'));
    if (response.statusCode == 200) {
      setState(() { randomDogImage = Future<String>.value(jsonDecode(response.body)['message']); });
    }
    else {
      setState(() { randomDogImage = Future<String>.error("Not this time"); });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Image'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: randomDogImage,
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.hasData) {
              return Image.network(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            } else {
              return const SizedBox(
                width: 60,
                height: 60,
                child: CircularProgressIndicator(),
              );
            }
          }
      )),
      floatingActionButton: FloatingActionButton(
        //TODO: remember we are trying to call a method on a button
        //press event and in order for the updated variable value
        //to be displayed on the UI, you need to do something...otherwise
        //irrespective of how many times you press this button, even if the
        //randomDogImage value is set, it won't show in the UI, unless
        //you do a hot restart.
        onPressed: _getDogUrlFromWeb,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
