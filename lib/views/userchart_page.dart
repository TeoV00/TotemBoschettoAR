import 'package:flutter/widgets.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/dataProvider/data_manager.dart';

const chartData = [
  {
    'nickname': 'Teo',
    'pos': 1,
  },
  {
    'nickname': 'Miki',
    'pos': 2,
  },
  {
    'nickname': 'Luca',
    'pos': 3,
  },
  {
    'nickname': 'Pippo',
    'pos': 4,
  },
  {
    'nickname': 'Luana',
    'pos': 5,
  },
  {
    'nickname': 'Manu',
    'pos': 6,
  },
  {
    'nickname': 'Manu',
    'pos': 7,
  },
  {
    'nickname': 'Manu',
    'pos': 8,
  }
];

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
          makeListColumn(
              itemCount: 5,
              items: chartData
                  .map((e) => Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: ChartItem(
                            nickname: e['nickname'] as String,
                            position: e['pos'] as int),
                      ))
                  .toList()),
        ],
      ),
    );
  }
}

Widget makeListColumn({required int itemCount, required List<Widget> items}) {
  var firstCol = items.sublist(1, itemCount + 1);
  var secCol = items.sublist(itemCount + 1);
  // secCol.removeAt(0);
  // secCol.insert(0, items.elementAt(2));
  // firstCol.removeAt(1);
  // firstCol.insert(firstCol.length, items.elementAt(itemCount));

  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [items.first],
        ),
      ),
      Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Column(
            children: firstCol,
          ),
          Column(
            children: secCol,
          )
        ],
      ),
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
