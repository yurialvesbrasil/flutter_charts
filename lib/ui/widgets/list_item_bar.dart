import 'package:flutter/material.dart';
import 'package:flutter_silver_bar/core/charts/bar/custom_rounded_bars.dart';
import 'package:flutter_silver_bar/core/charts/bar/grouped_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/grouped_bar_single_target_line_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/grouped_bar_target_line_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/grouped_fill_color_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/grouped_stacked_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/grouped_stacked_weight_pattern_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/horizontal_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/horizontal_bar_label_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/horizontal_bar_label_custom_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/horizontal_pattern_forward_hatch_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/pattern_forward_hatch_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/simple_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/spark_bar.dart';
import 'package:flutter_silver_bar/core/charts/bar/stacked_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/stacked_bar_target_line_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/stacked_fill_color_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/stacked_horizontal_bar_chart.dart';
import 'package:flutter_silver_bar/core/charts/bar/vertical_bar_label_chart.dart';

Widget listItemBar(int index, String title, Orientation orientation) => Card(
    elevation: 1,
    child: Container(
        height: 100.0,
        child: (index == 0)
            ? Padding(
                padding: EdgeInsets.all(4),
                child: SimpleBarChart.withRandomData())
            : (index == 1)
                ? Padding(
                    padding: EdgeInsets.all(4),
                    child: StackedBarChart.withRandomData())
                : (index == 2)
                    ? Padding(
                        padding: EdgeInsets.all(4),
                        child: GroupedBarChart.withRandomData())
                    : (index == 3)
                        ? Padding(
                            padding: EdgeInsets.all(4),
                            child: GroupedStackedBarChart.withRandomData())
                        : (index == 4)
                            ? Padding(
                                padding: EdgeInsets.all(4),
                                child:
                                    GroupedBarTargetLineChart.withRandomData())
                            : (index == 5)
                                ? Padding(
                                    padding: EdgeInsets.all(4),
                                    child: GroupedBarSingleTargetLineChart
                                        .withRandomData())
                                : (index == 6)
                                    ? Padding(
                                        padding: EdgeInsets.all(4),
                                        child: StackedBarTargetLineChart
                                            .withRandomData())
                                    : (index == 7)
                                        ? Padding(
                                            padding: EdgeInsets.all(4),
                                            child: HorizontalBarChart
                                                .withRandomData())
                                        : (index == 8)
                                            ? Padding(
                                                padding: EdgeInsets.all(4),
                                                child: StackedHorizontalBarChart
                                                    .withRandomData())
                                            : (index == 9)
                                                ? Padding(
                                                    padding: EdgeInsets.all(4),
                                                    child: HorizontalBarLabelChart
                                                        .withRandomData(
                                                            orientation))
                                                : (index == 10)
                                                    ? Padding(
                                                        padding: EdgeInsets.all(4),
                                                        child: HorizontalBarLabelCustomChart.withRandomData(orientation))
                                                    : (index == 11) ? Padding(padding: EdgeInsets.all(4), child: VerticalBarLabelChart.withRandomData()) : (index == 12) ? Padding(padding: EdgeInsets.all(8), child: SparkBar.withRandomData()) : (index == 13) ? Padding(padding: EdgeInsets.all(4), child: GroupedFillColorBarChart.withRandomData()) : (index == 14) ? Padding(padding: EdgeInsets.all(4), child: StackedFillColorBarChart.withRandomData()) : (index == 15) ? Padding(padding: EdgeInsets.all(4), child: PatternForwardHatchBarChart.withRandomData()) : (index == 16) ? Padding(padding: EdgeInsets.all(4), child: HorizontalPatternForwardHatchBarChart.withRandomData()) : (index == 17) ? Padding(padding: EdgeInsets.all(4), child: GroupedStackedWeightPatternBarChart.withRandomData()) : (index == 18) ? Padding(padding: EdgeInsets.all(4), child: CustomRoundedBars.withRandomData()) : Container()));
