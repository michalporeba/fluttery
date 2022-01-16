import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'model.dart';

class MyChart extends StatelessWidget {
  const MyChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SizeCubit, double>(
        builder: (context, size)
        {
          return charts.PieChart(_createData(size),
            animate: false,
          );
        }
      );
    }

  List<charts.Series<DataPoint, int>> _createData(double value) {
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

class DataPoint {
  int domain;
  int value;

  DataPoint({
    required this.domain,
    required this.value
  });
}