import 'package:flutter/material.dart';

class PieChartData {
  PieChartData(this.x, this.y, [this.color]);

  final String x;
  final double y;
  final Color? color;
}

class ChartData {
  ChartData(this.x, this.father, this.mother, this.son, this.daughter);

  final String x;
  final num father;
  final num mother;
  final num son;
  final num daughter;
}
