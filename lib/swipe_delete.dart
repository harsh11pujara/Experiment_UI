import 'package:flutter/material.dart';

class SwipeDelete extends StatelessWidget {
  SwipeDelete({Key? key}) : super(key: key);

  final ValueNotifier<List<String>> dataList = ValueNotifier<List<String>>([
    "Text 1",
    "Text 2",
    "Text 3",
    "Text 4",
    "Text 5",
    "Text 6",
    "Text 7",
  ]);

  @override
  Widget build(BuildContext context) {
    dataList.addListener(() {
      print("value change");
    });
    return Scaffold(
      body: ValueListenableBuilder<List<String>>(
        valueListenable: dataList,
        builder: (context, listValue, child) {
          List<String> tempList = listValue;

          return ListView.builder(
            itemCount: tempList.length,
            itemBuilder: (context, index) {

              return Dismissible(
                  key: UniqueKey(),
                  direction: DismissDirection.startToEnd,
                  dismissThresholds: const {DismissDirection.startToEnd : 0.6},
                  onDismissed: (details) {
                    List<String> tempList = [];
                    for (var e in dataList.value) {
                      if (e != dataList.value[index]) {
                        tempList.add(e);
                      }
                    }
                    dataList.value = tempList;
                  },
                  background: Container(
                    width: double.infinity,
                    color: Colors.blue[100],
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(left: 10),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                  child: Container(
                      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        width: double.infinity,
                        height: 50,
                        decoration: BoxDecoration(color: Colors.orange[200]),
                        child: Align(alignment: Alignment.centerLeft, child: Text(tempList[index])),
                      )));
            },
          );
        },
      ),
    );
  }
}
