/// Bar chart example
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class StackedHorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedHorizontalBarChart(this.seriesList, {this.animate});

  /// Creates a stacked [BarChart] with sample data and no transition.
  factory StackedHorizontalBarChart.withSampleData() {
    return new StackedHorizontalBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory StackedHorizontalBarChart.withRandomData() {
    return new StackedHorizontalBarChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final desktopSalesData = [
      new OrdinalSales(
          '2014', random.nextInt(100), charts.Color.fromHex(code: "#f44336")),
      new OrdinalSales(
          '2015', random.nextInt(100), charts.Color.fromHex(code: "#2196f3")),
      new OrdinalSales(
          '2016', random.nextInt(100), charts.Color.fromHex(code: "#4caf50")),
      new OrdinalSales(
          '2017', random.nextInt(100), charts.Color.fromHex(code: "#ffeb3b")),
    ];

    final tableSalesData = [
      new OrdinalSales(
          '2014', random.nextInt(100), charts.Color.fromHex(code: "#ef9a9a")),
      new OrdinalSales(
          '2015', random.nextInt(100), charts.Color.fromHex(code: "#90caf9")),
      new OrdinalSales(
          '2016', random.nextInt(100), charts.Color.fromHex(code: "#a5d6a7")),
      new OrdinalSales(
          '2017', random.nextInt(100), charts.Color.fromHex(code: "#fff59d")),
    ];

    final mobileSalesData = [
      new OrdinalSales(
          '2014', random.nextInt(100), charts.Color.fromHex(code: "#c62828")),
      new OrdinalSales(
          '2015', random.nextInt(100), charts.Color.fromHex(code: "#1565c0")),
      new OrdinalSales(
          '2016', random.nextInt(100), charts.Color.fromHex(code: "#2e7d32")),
      new OrdinalSales(
          '2017', random.nextInt(100), charts.Color.fromHex(code: "#f9a825")),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
        colorFn: (OrdinalSales sales, __) => sales.color,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
        colorFn: (OrdinalSales sales, __) => sales.color,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
        colorFn: (OrdinalSales sales, __) => sales.color,
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      barGroupingType: charts.BarGroupingType.stacked,
      vertical: false,
    );
  }

  /// Create series list with multiple series
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final desktopSalesData = [
      new OrdinalSales('2014', 5, charts.Color.fromHex(code: "#f44336")),
      new OrdinalSales('2015', 25, charts.Color.fromHex(code: "#2196f3")),
      new OrdinalSales('2016', 100, charts.Color.fromHex(code: "#4caf50")),
      new OrdinalSales('2017', 75, charts.Color.fromHex(code: "#ff5722")),
    ];

    final tableSalesData = [
      new OrdinalSales('2014', 25, charts.Color.fromHex(code: "#ef9a9a")),
      new OrdinalSales('2015', 50, charts.Color.fromHex(code: "#90caf9")),
      new OrdinalSales('2016', 10, charts.Color.fromHex(code: "#a5d6a7")),
      new OrdinalSales('2017', 20, charts.Color.fromHex(code: "#ffab91")),
    ];

    final mobileSalesData = [
      new OrdinalSales('2014', 10, charts.Color.fromHex(code: "#c62828")),
      new OrdinalSales('2015', 15, charts.Color.fromHex(code: "#1565c0")),
      new OrdinalSales('2016', 50, charts.Color.fromHex(code: "#2e7d32")),
      new OrdinalSales('2017', 45, charts.Color.fromHex(code: "#d84315")),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Desktop',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: desktopSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Tablet',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: tableSalesData,
      ),
      new charts.Series<OrdinalSales, String>(
        id: 'Mobile',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: mobileSalesData,
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;
  final charts.Color color;

  OrdinalSales(this.year, this.sales, this.color);
}
