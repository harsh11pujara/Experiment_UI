import 'dart:io';

import 'package:experiment_ui/create_pdf.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';


GlobalKey<State> chartKey1 = GlobalKey();
GlobalKey<State> chartKey2 = GlobalKey();
GlobalKey<State> chartKey3 = GlobalKey();


class Charts extends StatefulWidget {
  Charts({Key? key}) : super(key: key);

  @override
  State<Charts> createState() => _ChartsState();
}

class _ChartsState extends State<Charts> {
  @override
  void initState() {
    super.initState();

  }

  /// remove tooltip for pdf
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
      ChartData(2013, 400),

    ];

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            RepaintBoundary(
              key: chartKey1,
              child: SizedBox(
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
            ),
            const SizedBox(height: 20,),
            RepaintBoundary(
              key: chartKey2,
              child: SizedBox(
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
            ),
            const SizedBox(height: 20,),
            RepaintBoundary(
              key: chartKey3,
              child: SizedBox(
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
            ),
            const SizedBox(height: 20,),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePdf(),));
            }, child: const Text("PDF view"),),
            const SizedBox(height: 15,),
            ElevatedButton(onPressed: () {
             sharePdf();
            }, child: const Text("share PDF"),),
          ],
        ),
      ),
    );
  }

  sharePdf() async {
    /// setting
    final directory = Directory('/storage/emulated/0/Download');
    if(directory.existsSync())
    print(directory.existsSync());
    final file = File('${directory.path}/my_goal.pdf');
    final pdf = pw.Document();
    final image1 = await WidgetWrapper.fromKey(key: chartKey1,height: 100,width: 100,pixelRatio: 1);
    final image2 = await WidgetWrapper.fromKey(key: chartKey2,height: 100,width: 100,pixelRatio: 1);
    final image3 = await WidgetWrapper.fromKey(key: chartKey3,height: 100,width: 100,pixelRatio: 1);

    pdf.addPage(pw.Page(
      margin: const pw.EdgeInsets.all(10),
      pageFormat: PdfPageFormat.a4,
      build: (context) {
        return pw.Container(
            height: 900,
            width: 400,
            child: pw.Column(children: [
              pw.Container(
                decoration: const pw.BoxDecoration(color: PdfColors.blue200),
                child: pw.Text("hello"),
              ),
              pw.SizedBox(height: 20),
              pw.Container(height: 200, width: 400, color: PdfColors.green),
              pw.Container(
                  height: 200,
                  width: 290,
                  color: PdfColors.blue100,
                  child: pw.Image(image1,height: 200)
              ),
              pw.SizedBox(height: 20),
              pw.Container(
                  height: 200,
                  width: 290,
                  color: PdfColors.red100,
                  child: pw.Image(image2,height: 200)
              ),
            ])
        );
      },
    ));

    pdf.addPage(pw.Page(build: (context) {
      return pw.Column(
          children: [
            pw.SizedBox(height: 20),
            pw.Container(
                height: 200,
                width: 290,
                color: PdfColors.green100,
                child: pw.Image(image3,height: 200)
            ),
            pw.SizedBox(height: 20),
          ]
      );
    },));

    pdf.save();
    /// below command downloads the file
    await file.writeAsBytes(await pdf.save());
    XFile xFile = XFile(file.path);

    await Share.shareXFiles([xFile], text: 'Great picture');
  }
}

class ChartData {
  final double year;
  final double sales;

  ChartData(this.year, this.sales);
}
