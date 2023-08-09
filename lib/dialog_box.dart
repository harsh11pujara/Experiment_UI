import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class DialogBox extends StatelessWidget {
  DialogBox({Key? key}) : super(key: key);
  ValueNotifier<DateTime?> time = ValueNotifier<DateTime>(DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: 400,
        width: 400,
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
                        title: Text("Insert"),
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
                child: Text("Insert Todo")),
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
                                    child: Text("Cancel")),
                                ElevatedButton(
                                    onPressed: () {
                                      Navigator.pop(context);
                                    },
                                    child: Text("Save")),
                              ],
                            )
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Text("Add Time"))
          ],
        ),
      ),
    );
  }
}
