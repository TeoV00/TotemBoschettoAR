import 'package:flutter/material.dart';
import 'package:totem_boschetto/model/share_data_model.dart';
import 'package:totem_boschetto/views/chart_page/chart_item.dart';

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
