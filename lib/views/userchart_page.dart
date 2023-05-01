import 'package:flutter/material.dart';

import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/dataProvider/data_manager.dart';
import 'package:totem_boschetto/model/share_data_model.dart';

class UserChartView extends StatelessWidget {
  final DataManager dataManager;
  const UserChartView({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(30.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Text(
                  "Classifica Top 10",
                  style: TextStyle(fontSize: 40),
                ),
              ],
            ),
          ),
          FutureBuilder<List<SharedData>>(
            future: dataManager.getTop10User(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Chart();
              } else {
                return const CircularProgressIndicator();
              }
            },
          ),
        ],
      ),
    );
  }
}

class Chart extends StatefulWidget {
  const Chart({super.key});

  @override
  State<Chart> createState() => _ChartState();
}

class _ChartState extends State<Chart> {
  List<SharedData>? data;

  @override
  Widget build(BuildContext context) {
    List<ChartItem> chartItems = [];
    for (int i = 1; i <= 10; i++) {
      chartItems.add(ChartItem(
        position: i,
      ));
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [chartItems[0]],
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            chartItems[1],
            chartItems[2],
          ],
        ),
        Row(
          children: [
            Column(children: chartItems.sublist(3, 7)),
            Column(children: chartItems.sublist(7)),
          ],
        ),
      ],
    );
  }
}

class ChartItem extends StatefulWidget {
  final int position;
  const ChartItem({super.key, required this.position});

  @override
  State<ChartItem> createState() => _ChartItemState();
}

class _ChartItemState extends State<ChartItem> {
  String? nickname;

  @override
  Widget build(BuildContext context) {
    int position = widget.position;
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Stack(
        children: [
          Container(
            width: 440,
            height: 102,
            decoration: const BoxDecoration(
                boxShadow: [boxShadowBottom],
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Color.fromRGBO(243, 243, 243, 1)),
            child: Padding(
              padding: const EdgeInsets.all(15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      "$position°",
                      style: const TextStyle(fontSize: 28),
                    ),
                  ),
                  const Spacer(),
                  Text(
                    nickname ?? '',
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
          if (position > 0 && position < 4) ...[
            Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Image.asset(
                '$iconsPath/medals/medal-$position.png',
                height: 115,
              ),
            )
          ]
        ],
      ),
    );
  }

  void setData({required String nickname}) {
    setState(() {
      this.nickname = nickname;
    });
  }
}
