/// Horizontal bar chart with custom style for each datum in the bar label.
// EXCLUDE_FROM_GALLERY_DOCS_START
import 'dart:math';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class HorizontalBarLabelCustomChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  HorizontalBarLabelCustomChart(this.seriesList, {this.animate});

  /// Creates a [BarChart] with sample data and no transition.
  static HorizontalBarLabelCustomChart createWithSampleData() {
    return new HorizontalBarLabelCustomChart(
      _createSampleData(),
      // Disable animations for image tests.
      animate: false,
    );
  }

  // EXCLUDE_FROM_GALLERY_DOCS_START
  // This section is excluded from being copied to the gallery.
  // It is used for creating random series data to demonstrate animation in
  // the example app only.
  factory HorizontalBarLabelCustomChart.withRandomData(
      Orientation orientation) {
    return new HorizontalBarLabelCustomChart(_createRandomData(orientation));
  }

  /// Create random data.
  static List<charts.Series<OrdinalSales, String>> _createRandomData(
      Orientation orientation) {
    final random = new Random();

    final data = [
      new OrdinalSales('2014', random.nextInt(100)),
      new OrdinalSales('2015', random.nextInt(100)),
      new OrdinalSales('2016', random.nextInt(100)),
      new OrdinalSales('2017', random.nextInt(100)),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        colorFn: (_, __) => charts.Color.fromHex(code: "#f44336"),
        // Set a label accessor to control the text of the bar label.
        labelAccessorFn: (OrdinalSales sales, _) =>
            '${sales.year}:  R\$ ${sales.sales.toString() + "," + random.nextInt(100).toString()}',
        insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
          final color = (sales.year == '2014')
              ? charts.MaterialPalette.white
              : charts.MaterialPalette.cyan.shadeDefault.darker;
          return new charts.TextStyleSpec(
            color: color,
            fontSize: (orientation == Orientation.landscape) ? 14 : 8,
          );
        },
        outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
          final color = (sales.year == '2014')
              ? charts.MaterialPalette.blue.shadeDefault
              : charts.MaterialPalette.yellow.shadeDefault.darker;
          return new charts.TextStyleSpec(
              color: color,
              fontSize: (orientation == Orientation.landscape) ? 14 : 8);
        },
      ),
    ];
  }
  // EXCLUDE_FROM_GALLERY_DOCS_END

  // The [BarLabelDecorator] has settings to set the text style for all labels
  // for inside the bar and outside the bar. To be able to control each datum's
  // style, set the style accessor functions on the series.
  @override
  Widget build(BuildContext context) {
    return new charts.BarChart(
      seriesList,
      animate: animate,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      // Hide domain axis.
      domainAxis:
          new charts.OrdinalAxisSpec(renderSpec: new charts.NoneRenderSpec()),
    );
  }

  /// Create one series with sample hard coded data.
  static List<charts.Series<OrdinalSales, String>> _createSampleData() {
    final data = [
      new OrdinalSales('2014', 5),
      new OrdinalSales('2015', 25),
      new OrdinalSales('2016', 100),
      new OrdinalSales('2017', 75),
    ];

    return [
      new charts.Series<OrdinalSales, String>(
        id: 'Sales',
        domainFn: (OrdinalSales sales, _) => sales.year,
        measureFn: (OrdinalSales sales, _) => sales.sales,
        data: data,
        // Set a label accessor to control the text of the bar label.
        labelAccessorFn: (OrdinalSales sales, _) =>
            '${sales.year}: \$${sales.sales.toString()}',
        insideLabelStyleAccessorFn: (OrdinalSales sales, _) {
          final color = (sales.year == '2014')
              ? charts.MaterialPalette.red.shadeDefault
              : charts.MaterialPalette.yellow.shadeDefault.darker;
          return new charts.TextStyleSpec(color: color);
        },
        outsideLabelStyleAccessorFn: (OrdinalSales sales, _) {
          final color = (sales.year == '2014')
              ? charts.MaterialPalette.red.shadeDefault
              : charts.MaterialPalette.yellow.shadeDefault.darker;
          return new charts.TextStyleSpec(color: color);
        },
      ),
    ];
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}
