import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

_MyChartState chartState = _MyChartState();

class MyChart extends StatefulWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  State<MyChart> createState() => chartState;

  static List<charts.Series<DataPoint, int>> _createData(double value) {
    double modifier = 1.0-value;
    final data = [
      DataPoint(domain: 0, value: (50*modifier).toInt()),
      DataPoint(domain: 1, value: (37*modifier).toInt()),
      DataPoint(domain: 2, value: (13*modifier).toInt()),
      DataPoint(domain: 3, value: (100-(100*modifier)).toInt()),
    ];

    return [
      charts.Series<DataPoint, int>(
        id: 'Sample',
        domainFn: (DataPoint sales, _) => sales.domain,
        measureFn: (DataPoint sales, _) => sales.value,
        data: data,
      )
    ];
  }
}

class _MyChartState extends State<MyChart> {
  double _value = 0.4;

  @override
  Widget build(BuildContext context) {
    return charts.PieChart(MyChart._createData(_value),
        animate: false,
    );
  }

  void setValue(double value) {
    setState(() { _value = value; });
  }
}

class DataPoint {
  int domain;
  int value;

  DataPoint({
    required this.domain,
    required this.value
  });
}