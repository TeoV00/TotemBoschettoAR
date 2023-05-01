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
          FutureBuilder<List<SharedData?>>(
            future: dataManager.getTop10User(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Chart(
                  data: snapshot.data!,
                );
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

class Chart extends StatelessWidget {
  final List<SharedData?> data;
  static int chartItemCount = 10;
  const Chart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<ChartItem> chartItems = [];

    for (int i = 1; i <= chartItemCount; i++) {
      String nickname = data[i - 1] != null ? data[i - 1]!.nickname : '';
      chartItems.add(ChartItem(
        nickname: nickname,
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
        Padding(
          padding: const EdgeInsets.only(top: 50.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(children: chartItems.sublist(3, 7)),
              Column(children: chartItems.sublist(7)),
            ],
          ),
        ),
      ],
    );
  }
}

class ChartItem extends StatelessWidget {
  final int position;
  final String nickname;

  const ChartItem({super.key, required this.position, required this.nickname});

  @override
  Widget build(BuildContext context) {
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
                    nickname,
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
}
