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
  Future<List<String>>? randomDogImages;
  final Client client = Client();

  Future<void> _prepareFetch() async {
    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => const PrepareRequestPopup(),
    ).then((value) async => _getDogUrlFromWeb(value));
  }

  void _getDogUrlFromWeb(int dogs) async {

    var response = await client.get(Uri.https('dog.ceo', '/api/breeds/image/random/$dogs'));
    if (response.statusCode == 200) {
      setState(() { randomDogImages = Future<List<String>>.value(List.from(jsonDecode(response.body)['message'])); });
    }
    else {
      setState(() { randomDogImages = Future<List<String>>.error("Not this time"); });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Random Dog Image'),
      ),
      body: Center(
        child: FutureBuilder<List<String>>(
          future: randomDogImages,
          builder: (BuildContext context, AsyncSnapshot<List<String>> snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) =>
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text((1+index).toString(), style: Theme.of(context).textTheme.headline1),
                    ),
                    Image.network(snapshot.data![index])
                  ]
                )
              );
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
        onPressed: _prepareFetch, //_getDogUrlFromWeb,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}


class PrepareRequestPopup extends StatefulWidget {
  const PrepareRequestPopup({Key? key}) : super(key: key);

  @override
  State<PrepareRequestPopup> createState() => _PrepareRequestPopupState();
}

class _PrepareRequestPopupState extends State<PrepareRequestPopup> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController _dogsNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(
        'How many dogs do you want to see?',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Get me the dogs!'),
          onPressed: () {
            if (_formKey.currentState!.validate()) {
              Navigator.of(context).pop(int.parse(_dogsNumberController.text));
            }
          },
        ),
      ],
      content: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              controller: _dogsNumberController,
              decoration: InputDecoration(
                labelText: 'Number between 1 and 50',
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0)
                )
              ),
              validator: (value) {
                if (value == null || value.isEmpty) { return 'We need something in here!'; }
                else {
                  int? n = int.tryParse(value);
                  if (n == null) { return 'We need a number!';}
                  if (n < 1) { return 'The number needs to be at least 1!';}
                  if (n > 50) { return 'The number cannot be more than 50!'; }
                }
                return null;
              }
            )
          ]
        )
      ),
    );
  }
}

