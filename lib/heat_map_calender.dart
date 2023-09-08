import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';

class HeatMapCalender extends StatefulWidget {
  const HeatMapCalender({Key? key}) : super(key: key);

  @override
  State<HeatMapCalender> createState() => _HeatMapCalenderState();
}

class _HeatMapCalenderState extends State<HeatMapCalender> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.black54,
        child: HeatMap(
          startDate: DateTime(2023, 9,1),
          endDate: DateTime(2023, 9, 30),
          size: 40,
          showColorTip: false,
          datasets: {
            DateTime(2023, 9, 6): 3,
            DateTime(2023, 9, 7): 7,
            DateTime(2023, 9, 8): 11,
            DateTime(2023, 9, 9): 13,
            DateTime(2023, 9, 13): 5,
          },
          colorMode: ColorMode.opacity,
          showText: true,
          scrollable: true,
          colorsets: const {
            1: Colors.red,
            3: Colors.orange,
            5: Colors.yellow,
            7: Colors.green,
            9: Colors.blue,
            11: Colors.indigo,
            13: Colors.purple,
          },
          onClick: (value) {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(value.toString())));
          },
        ),
      ),
    );
  }
}
