import 'dart:typed_data';

import 'package:experiment_ui/charts.dart';
import 'package:experiment_ui/dialog_box.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:printing/printing.dart';

class CreatePdf extends StatefulWidget {
  const CreatePdf({Key? key}) : super(key: key);

  @override
  State<CreatePdf> createState() => _CreatePdfState();
}

class _CreatePdfState extends State<CreatePdf> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PdfPreview(allowSharing: true,build: (format) => createPdf(),),
    );
  }

  Future<Uint8List> createPdf() async {
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

    return pdf.save();
  }
}
