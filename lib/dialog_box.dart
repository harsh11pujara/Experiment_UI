import 'dart:typed_data';

import 'package:experiment_ui/charts.dart';
import 'package:experiment_ui/create_pdf.dart';
import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';
import 'package:printing/printing.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;

GlobalKey<State> randomKey = GlobalKey();

class DialogBox extends StatelessWidget {
  DialogBox({Key? key}) : super(key: key);

  final ValueNotifier<DateTime?> time = ValueNotifier<DateTime>(DateTime.now());

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SizedBox(
        height: 1000,
        width: 600,
        child: RepaintBoundary(
          key: randomKey,
          child: Container(
            color: Colors.red[300],
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              mainAxisSize: MainAxisSize.max,
              children: [
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: const Text("Insert"),
                            content: SizedBox(
                              height: 200,
                              width: 300,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                      width: 200,
                                      child: TextField(
                                        decoration: InputDecoration(hintText: "task"),
                                      )),
                                  const SizedBox(
                                    height: 30,
                                  ),
                                  SizedBox(
                                    width: 200,
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          child: TextField(
                                            decoration: const InputDecoration(hintText: "time"),
                                            onTap: () {
                                              showTimePicker(context: context, initialTime: TimeOfDay.now());
                                            },
                                          ),
                                        ),
                                        Expanded(
                                          child: TextField(
                                            decoration: const InputDecoration(hintText: "date"),
                                            onTap: () {
                                              showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime.now(),
                                                  firstDate: DateTime(1990),
                                                  lastDate: DateTime(2050));
                                            },
                                          ),
                                        )
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Insert Todo")),
                ElevatedButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 180,
                                  child: Stack(
                                    children: [
                                      Center(
                                          child: Container(
                                        height: 45,
                                        decoration: BoxDecoration(
                                            border: Border.symmetric(
                                                horizontal: BorderSide(color: Colors.pink[200]!, width: 2),
                                                vertical: BorderSide.none)),
                                      )),
                                      TimePickerSpinner(
                                        is24HourMode: true,
                                        time: DateTime(2023),
                                        highlightedTextStyle: TextStyle(color: Colors.pink[200], fontSize: 32),
                                        onTimeChange: (value) {
                                          time.value = value;
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          time.value = null;
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Cancel")),
                                    ElevatedButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        child: const Text("Save")),
                                  ],
                                )
                              ],
                            ),
                          );
                        },
                      );
                    },
                    child: const Text("Add Time")),
                SizedBox(height: 200, child: Image.network("https://media.tenor.com/-Y2YOay3_JoAAAAM/its-friday-dancing.gif")),
                // Expanded(child: PdfPreview(build: (format) => createPdf(),))
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CreatePdf(),));
                }, child: const Text("View pdf"))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<WidgetWrapper> customImg() async{
   final image = await WidgetWrapper.fromKey(key: randomKey,height: 100,width: 100,pixelRatio: 1);
   return image;
  }


}
