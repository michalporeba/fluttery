import 'package:flutter/material.dart';
import 'package:fuxim_demo/signin/signing1.dart';
import 'package:fuxim_demo/signin/signing2.dart';
import 'package:fuxim_demo/signin/signing3.dart';

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
      home: const DemoHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class DemoHomePage extends StatelessWidget {
  final String title;
  const DemoHomePage({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SampleButton(text: 'Mock Sign-in',
                  sample: SampleSet(
                      title: 'Mock Sign-in Page',
                      samples: const [
                        SignInOne(),
                        SignInTwo(),
                        SignInThree(),
                      ]
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class SampleButton extends StatelessWidget {
  String text;
  Widget? sample;

  SampleButton({
    required this.text,
    this.sample,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: [
          Expanded(
            flex: 1,
            child: ElevatedButton(
                onPressed: () => sample == null
                    ? null
                    : Navigator.push(context, MaterialPageRoute(builder: (context) => sample!)),
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Text(text, style: Theme.of(context).textTheme.headline4,),
                )),
          ),
        ],
      ),
    );
  }
}

class SampleSet extends StatelessWidget {
  String title;
  List<Widget> samples;

  SampleSet({
    required this.title,
    required this.samples,
    Key? key
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final PageController controller = PageController();
    return Scaffold(
      appBar: AppBar(title: Text(title),
        leading: GestureDetector(
          onTap: () { /* Write listener code here */ },
          child: const Icon(
            Icons.menu,  // add custom icons also
          ),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(right: 20.0),
              child: GestureDetector(
                onTap: () { Navigator.pop(context); },
                child: const Icon(
                    Icons.logout
                ),
              )
          ),
        ],
      ),
      body: PageView(
          controller: controller,
          children: samples
      ),
    );
  }
}

