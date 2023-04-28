import 'package:flutter/widgets.dart';
import 'package:totem_boschetto/constant_vars.dart';
import 'package:totem_boschetto/dataProvider/data_manager.dart';

class Top10View extends StatelessWidget {
  final DataManager dataManager;
  const Top10View({super.key, required this.dataManager});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Row(
            children: const [
              ChartItem(
                nickname: "TeoC",
                position: 1,
              ),
              ChartItem(
                nickname: "TeoC",
                position: 4,
              ),
              ChartItem(
                nickname: "TeoC",
                position: 2,
              ),
              ChartItem(
                nickname: "TeoC",
                position: 3,
              )
            ],
          ),
        )
      ],
    );
  }
}

class ChartItem extends StatelessWidget {
  final String nickname;
  final int position;

  const ChartItem({super.key, required this.nickname, required this.position});

  @override
  Widget build(BuildContext context) {
    return Container(
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
            position > 0 && position < 4
                ? Image.asset(
                    '$iconsPath/medals/medal-$position.png',
                    height: 115,
                  )
                : Text(
                    "$position°",
                    style: const TextStyle(fontSize: 28),
                  ),
            const Spacer(),
            Text(
              nickname,
              style: const TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
