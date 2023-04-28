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
                List<Widget> chartItems = [];
                int pos = 1;
                for (SharedData e in (snapshot.data ?? [])) {
                  chartItems.add(Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ChartItem(
                      nickname: e.nickname.toString(),
                      position: pos,
                    ),
                  ));
                  pos++;
                }
                return makeListColumn(itemCount: 5, items: chartItems);
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

Widget makeListColumn({required int itemCount, required List<Widget> items}) {
  List<Widget> secCol = [];

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            items.isNotEmpty
                ? items.first
                : const ChartItem(nickname: '', position: 1)
          ],
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          items.length >= 2
              ? items[2]
              : const ChartItem(nickname: '', position: 2),
          items.length >= 3
              ? items[3]
              : const ChartItem(nickname: '', position: 3),
        ],
      ),
      SizedBox(
        height: 600,
        child: GridView.count(
          crossAxisCount: 2,
          children:
              items.length > 3 ? items.getRange(3, items.length).toList() : [],
        ),
      ),
      // Row(
      //   crossAxisAlignment: CrossAxisAlignment.start,
      //   mainAxisAlignment: MainAxisAlignment.spaceAround,
      //   children: [
      //     Column(
      //       children: items.length > 3
      //           ? items.sublist(
      //               3,
      //             )
      //           : [],
      //     ),
      //     Column(
      //       children: secCol,
      //     )
      //   ],
      // ),
    ],
  );
}

class ChartItem extends StatelessWidget {
  final String nickname;
  final int position;

  const ChartItem({super.key, required this.nickname, required this.position});

  @override
  Widget build(BuildContext context) {
    return Stack(
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
    );
  }
}
