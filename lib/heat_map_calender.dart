import 'package:flutter/material.dart';
import 'package:flutter_heatmap_calendar/flutter_heatmap_calendar.dart';
import 'package:timelines/timelines.dart';

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
        child: Column(
          children: [
            HeatMap(
              startDate: DateTime(2023, 9, 1),
              endDate: DateTime(2023, 9, 30),
fontSize: 6,
              size: 20,
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
            /// Linear heat map like view
            // Container(
            //   height: 10,
            //   width: 400,
            //   color: Colors.yellow[200],
            //   child: ListView.builder(shrinkWrap: true, scrollDirection: Axis.horizontal,itemCount: 31,itemBuilder: (context, index) {
            //     return Container(
            //       height: 15,
            //       width: 15,
            //       decoration: BoxDecoration(
            //         color: Colors.blue[200],
            //         borderRadius: BorderRadius.circular(1)
            //       ),
            //       child: Center(child: Text(index.toString(), style: TextStyle(fontSize: 8,fontWeight: FontWeight.w700),)),
            //     );
            //   },),
            // ),

            SizedBox(
              height: 150,
              child: FixedTimeline.tileBuilder(

                  direction: Axis.horizontal,
                  builder: TimelineTileBuilder.connected(
                    itemCount: 3,
                    indicatorBuilder: (context, index) {
                      return DotIndicator(
                        color: Colors.white,
                        size: 20,
                        child: Text("${index + 1}"),
                      );
                    },
                    connectorBuilder: (context, index, type) {
                      return const SolidLineConnector(
                        color: Colors.white,
                        direction: Axis.horizontal,
                        space: 20,
                        indent: 15,
                        endIndent: 15,
                      );
                    },
                  )),
            )
          ],
        ),
      ),
    );
  }
}
