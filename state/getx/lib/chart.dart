import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'controller.dart';
import 'package:get/get.dart';

class MyChart extends StatelessWidget {
  MyChart({Key? key}) : super(key: key);

  final Controller c = Get.find();
  @override
  Widget build(BuildContext context) {
    return Obx(() => charts.PieChart(_createData(c.size.value),
        animate: false,
    ));
  }

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

class DataPoint {
  int domain;
  int value;

  DataPoint({
    required this.domain,
    required this.value
  });
}