import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Charts',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Flutter Charts'),
        ),
        body: Center(
          child: SizedBox(
            height: 300,
            width: 400,
            child: charts.LineChart(
              _createData(),
              animate: true,
              domainAxis: charts.NumericAxisSpec(
                tickProviderSpec: charts.BasicNumericTickProviderSpec(
                  desiredTickCount: 10,
                ),
                renderSpec: charts.SmallTickRendererSpec(
                  labelStyle: charts.TextStyleSpec(
                    fontSize: 12,
                    color: charts.MaterialPalette.black,
                  ),
                ),
              ),
              primaryMeasureAxis: charts.NumericAxisSpec(
                tickProviderSpec: charts.BasicNumericTickProviderSpec(
                  desiredTickCount: 5,
                ),
                renderSpec: charts.GridlineRendererSpec(
                  labelStyle: charts.TextStyleSpec(
                    fontSize: 12,
                    color: charts.MaterialPalette.black,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<charts.Series<LinearSales, int>> _createData() {
    final data = List.generate(20, (index) => LinearSales(index, index * 5));

    return [
      charts.Series<LinearSales, int>(
        id: 'Sales',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        data: data,
      ),
    ];
  }
}

class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
