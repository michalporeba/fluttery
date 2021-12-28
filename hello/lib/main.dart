import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    title: 'Hello World Title',
    home: Home()
  );
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        title: Text("Hello World App"),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Center(
              child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text('Hello',
                          style: TextStyle(
                              fontSize: 26,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue[800]
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text('Discover the World',
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.deepPurpleAccent
                          )
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Image.network('https://images.freeimages.com/images/large-previews/934/antelope-canyon-6-1532993.jpg',
                          height: 350
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                        child: Text('Contact us'),
                        onPressed: ()=> contactUs(context),
                      ),
                    )
                  ]
              )
          ),
        ),
      )
  );

  void contactUs(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext context) => AlertDialog(
            title: Text('Contact Us'),
            content: Text('bla bla bla'),
            actions: <Widget>[
              TextButton(
                  child: Text('Close'),
                  onPressed: () => Navigator.of(context).pop()
              )
            ]
        )
    );
  }
}