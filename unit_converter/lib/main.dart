import 'package:flutter/material.dart';

void main() => runApp(UnitConverterApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: Scaffold(
        appBar: AppBar(title: Text('Unit Converter')),
        body: Center(child: Text('Things to convert')),
      ),
    );
  }
}

class UnitConverterApp extends StatefulWidget {
  @override
  UnitConverterState createState() => UnitConverterState();
}

class UnitConverterState extends State<UnitConverterApp> {
  double _from = 0;
  String? _fromMeasure;
  String? _toMeasure;

  @override
  void initState() {
    _from = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converte',
      home: Scaffold(
        appBar: AppBar(title: Text('Unit Converter')),
        body: Container(
          color: Colors.amberAccent,
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Column(
                children:[
                  Text('Value', style: _labelStyle,),
                  TextField(
                    onChanged: (text) => _acceptText(text),
                    style: _inputStyle,
                      decoration: const InputDecoration(
                          hintText: 'Specify the value to be converted'
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text('From', style: _labelStyle),
                  ),
                  DropdownButton<String>(
                    items: _measures.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                      );
                    }).toList(),
                    onChanged: (value) => setState(() {_fromMeasure = value;}),
                    value: _fromMeasure,
                    isExpanded: true,
                    hint: const Text('Select original unit'),
                    style: _inputStyle
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text('To', style: _labelStyle),
                  ),
                  DropdownButton<String>(
                      items: _measures.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value)
                        );
                      }).toList(),
                      onChanged: (value) => setState(() {_toMeasure = value;}),
                      value: _toMeasure,
                      isExpanded: true,
                      hint: const Text('Select target unit'),
                      style: _inputStyle
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton(
                        onPressed: null,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Text('Calculate', style: _labelStyle),
                        )
                    ),
                  )
                ]
              )
          ),
        ),
      ),
    );
  }

  void _acceptText(text) {
    double? value = double.tryParse(text);
    if (value != null) {
      setState(() {_from = value;});
    }
  }

  final List<String> _measures = [
    'meters', 'kilometers', 'grams', 'kilograms', 'feet', 'miles', 'punds (lbs)', 'ounces'
  ];

  final TextStyle _labelStyle = const TextStyle(
    fontSize: 24,
    color: Colors.blueAccent
  );

  final TextStyle _inputStyle = const TextStyle(
    fontSize: 20,
    color: Colors.blueGrey,
  );
}