import 'package:flutter/material.dart';
import 'package:select_form_field/select_form_field.dart';

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
      home: const MyHomePage(title: 'A Sample Form App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _dropdownController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextFormField(
                    controller: _nameController,
                    decoration: InputDecoration(
                        labelText: 'Your name',
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0)
                        )
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) { return 'We need something in here!'; }
                      return null;
                    }
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SelectFormField(
                  //controller: _dropdownController,
                  type: SelectFormFieldType.dropdown,
                  initialValue: 'one',
                  labelText: 'Choose an option',
                  items: const [
                    {
                    'value': 'one',
                    'label': 'Option One',
                    'icon': Icon(Icons.check_box_outlined),
                    },
                    {
                      'value': 'two',
                      'label': 'Option Two',
                      'icon': Icon(Icons.error),
                      'textStyle': TextStyle(color: Colors.red),
                    },

                  ],
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Submit',
        child: const Icon(Icons.agriculture),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
