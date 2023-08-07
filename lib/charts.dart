import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Charts extends StatelessWidget {
  const Charts({Key? key}) : super(key: key);

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
      body: Container(height: 300, width: 400, child: SfCartesianChart(

        series: <ChartSeries>[
          StackedLineSeries<ChartData, num>(
              dataSource: chartData,
              xValueMapper: (ChartData data, _) => data.year,
              yValueMapper: (ChartData data, _) => data.sales
          ),

        ],
        primaryXAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
        primaryYAxis: NumericAxis(edgeLabelPlacement: EdgeLabelPlacement.shift),
      ),),
    );
  }
}

class ChartData {
  final double year;
  final double sales;

  ChartData(this.year, this.sales);
}