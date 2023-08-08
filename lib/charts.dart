import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  Charts({Key? key}) : super(key: key);
  final TooltipBehavior _tooltipBehavior = TooltipBehavior(
    enable: true,
    color: Colors.pink[200],
    builder: (data, point, series, pointIndex, seriesIndex) {
      print("${point.x} ${point.y}");
      return Container(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Text(
            "${point.y}",
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.w700),
          ));
    },
  );

  @override
  Widget build(BuildContext context) {
    List<ChartData> chartData = [
      ChartData(2005, 20),
      ChartData(2006, 60),
      ChartData(2007, 305),
      ChartData(2008, 100),
      ChartData(2009, 10),
      ChartData(2010, 90),
      ChartData(2011, 400),
    ];

    return Scaffold(
      body: SizedBox(
        height: 300,
        width: 400,
        child: SfCartesianChart(
          tooltipBehavior: _tooltipBehavior,
          series: <ChartSeries>[
            StackedLineSeries<ChartData, num>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.year,
              yValueMapper: (ChartData data, _) => data.sales,
              markerSettings: const MarkerSettings(isVisible: true),
              color: Colors.pink[200],
              enableTooltip: true,
            ),
          ],
          primaryXAxis: NumericAxis(
              majorGridLines: const MajorGridLines(width: 0),
              isVisible: true,
              axisLine: const AxisLine(width: 0),
              edgeLabelPlacement: EdgeLabelPlacement.shift),
          primaryYAxis: NumericAxis(
              majorTickLines: const MajorTickLines(width: 0),
              isVisible: true,
              axisLine: const AxisLine(width: 0),
              edgeLabelPlacement: EdgeLabelPlacement.shift),
        ),
      ),
    );
  }
}

class ChartData {
  final double year;
  final double sales;

  ChartData(this.year, this.sales);
}
