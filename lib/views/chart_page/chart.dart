import 'package:flutter/material.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/views/chart_page/chart_item.dart';
import 'package:totem_boschetto/views/common/utilityShelfTree.dart';

class Chart extends StatelessWidget {
  final List<SharedData?> data;
  static int chartItemCount = 10;
  const Chart({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    List<Widget> chartItems = [];

    for (int i = 1; i <= chartItemCount; i++) {
      String nickname = '';
      int co2Kg = 0;
      SharedData? usrData = data[i - 1];
      if (usrData != null) {
        nickname = usrData.nickname;
        co2Kg = usrData.co2;
      }

      chartItems.add(
        ChartItem(
          nickname: nickname,
          position: i,
          co2Kg: co2Kg,
          tailChild: getLevelPicture(level: usrData?.level ?? 0),
        ),
      );
    }

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
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
          padding: const EdgeInsets.only(top: 40.0),
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
