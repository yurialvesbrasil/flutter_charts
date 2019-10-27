/// Horizontal bar chart example
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HorizontalBarChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  factory HorizontalBarChart.withSampleData() {
    return new HorizontalBarChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory HorizontalBarChart.withRandomData() {
    return new HorizontalBarChart(_createRandomData());
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData() {
    final random = new Random();

    final data = [
      new OrdinalSales('2014', random.nextInt(100),
          charts.MaterialPalette.blue.shadeDefault),
      new OrdinalSales(
          '2015', random.nextInt(100), charts.MaterialPalette.red.shadeDefault),
      new OrdinalSales('2016', random.nextInt(100),
          charts.MaterialPalette.green.shadeDefault),
      new OrdinalSales('2017', random.nextInt(100),
          charts.MaterialPalette.yellow.shadeDefault),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        colorFn: (OrdinalSales sales, __) => sales.color,
      )
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  @override
  Widget build(BuildContext context) {
    // For horizontal bar charts, set the [vertical] flag to false.
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5, charts.MaterialPalette.blue.shadeDefault),
      new OrdinalSales('2015', 25, charts.MaterialPalette.blue.shadeDefault),
      new OrdinalSales('2016', 100, charts.MaterialPalette.blue.shadeDefault),
      new OrdinalSales('2017', 75, charts.MaterialPalette.blue.shadeDefault),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
      )
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
