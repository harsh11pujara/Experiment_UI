import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

class DialogBox extends StatelessWidget {
  const DialogBox({Key? key}) : super(key: key);

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
                              SizedBox(width: 200,child: const TextField(decoration: InputDecoration(hintText: "task"),)),
                              const SizedBox(height: 30,),
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
            ElevatedButton(onPressed: () {
              showDialog(context: context, builder: (context) {
                return AlertDialog(content: TimePickerSpinner(is24HourMode: true,time: DateTime(2023)),);
              },);
            }, child: Text("Add Time"))
          ],
        ),
      ),
    );
  }
}
