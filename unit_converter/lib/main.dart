import 'package:flutter/material.dart';

void main() => runApp(UnitConverterApp());

class UnitConverterApp extends StatefulWidget {
  const UnitConverterApp({Key? key}) : super(key: key);

  @override
  UnitConverterState createState() => UnitConverterState();
}

class UnitConverterState extends State<UnitConverterApp> {
  double? _from;
  String? _fromMeasure;
  String? _toMeasure;
  String? _result;
  final List<String> _targetMeasures = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Unit Converter',
      home: Scaffold(
        appBar: AppBar(title: const Text('Unit Converter')),
        body: Container(
          color: Colors.amberAccent,
          padding: const EdgeInsets.all(16.0),
          child: Center(
              child: Column(
                children:[
                  Text('Value', style: _labelStyle,),
                  TextField(
                    onChanged: (text) => _handleValue(text),
                    style: _inputStyle,
                      decoration: const InputDecoration(
                          hintText: 'Specify the value to be converted'
                      )
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 32.0),
                    child: Text('From', style: _labelStyle,),
                  ),
                  DropdownButton<String>(
                    items: _measures.keys.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value)
                      );
                    }).toList(),
                    onChanged: (value) => _handleFromUnitChange(value),
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
                      items: _targetMeasures.map((String value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value)
                        );
                      }).toList(),
                      onChanged: (value) => _handleToUnitChange(value),
                      value: _toMeasure,
                      isExpanded: true,
                      hint: const Text('Select target unit'),
                      style: _inputStyle
                  ),
                  const Spacer(),
                  Text(_result ?? '', style: const TextStyle(
                    fontSize: 48,
                    color: Colors.deepOrange,
                    fontWeight: FontWeight.bold
                  )),
                  Padding(
                    padding: const EdgeInsets.all(32.0),
                    child: ElevatedButton(
                        onPressed: _canCalculate() ? () => _calculate() : null,
                        child: const Padding(
                          padding: EdgeInsets.all(16.0),
                          child: Text('Calculate', style: TextStyle(
                            fontSize: 32
                          )),
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

  void _handleValue(text) {
    setState(() {
      _result = null;
      _from = double.tryParse(text);
    });
  }

  void _handleFromUnitChange(value)
  {
    setState(() {
      _result = null;
          _fromMeasure = value;
          _targetMeasures.clear();
      List<num> formulas = _formulas[_measures[_fromMeasure].toString()];
      _measures.forEach((key, value) {
        if (formulas[value] > 0.0 && formulas[value] != 1.0) {
          _targetMeasures.add(key);
        }
      });
      if (!_targetMeasures.contains(_toMeasure)) {
        _toMeasure = null;
      }
    });
  }

  void _handleToUnitChange(value)
  {
    setState(() {
      _toMeasure = value;
      _result = null;
    });
  }

  bool _canCalculate() {
    return _from != null
      && _fromMeasure != null
      && _toMeasure != null
      && _result == null;
  }

  void _calculate() {
    setState(() {
      List<num> formulas = _formulas[_measures[_fromMeasure].toString()];

      num formula = formulas[_measures[_toMeasure] ?? 0];
      _result = (formula * (_from ?? 0)).toString();
    });
  }

  final Map<String, int> _measures = {
    'meters': 0, 'kilometers': 1, 'grams': 2, 'kilograms': 3,
    'feet': 4, 'miles': 5, 'pounds (lbs)': 6, 'ounces': 7
  };

  final dynamic _formulas = {
    '0': [1, 0.001, 0, 0, 3.28084, 0.000621371, 0, 0],
    '1': [1000, 1, 0, 0, 3280.84, 0.621371, 0, 0],
    '2': [0, 0, 1, 0.001, 0, 0, 0.00220462, 0.035274],
    '3': [0, 0, 1000, 1, 0, 0, 2.20462, 35.274],
    '4': [0.3048, 0.0003048, 0, 0, 1, 0.000189394, 0, 0],
    '5': [1609.34, 1.60934, 0, 0, 5280, 1, 0, 0],
    '6': [0, 0, 453.592, 0.453592, 0, 0, 1, 16],
    '7': [0, 0, 28.3495, 0.0283495, 0, 0, 0.0625, 1]
  };

  final TextStyle _labelStyle = const TextStyle(
    fontSize: 24,
    color: Colors.blueAccent
  );

  final TextStyle _inputStyle = const TextStyle(
    fontSize: 20,
    color: Colors.blueGrey,
  );
}