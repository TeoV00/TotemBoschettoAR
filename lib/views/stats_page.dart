import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/statistic_widgets/stats_circle.dart';

const statIconPath = "/icons/statistics/";
const circleSize =
    230; //TODO: contorllare perche se aumento non si ingrandisce il cerchio
var iconSize = circleSize - 150.0;

var stat = <StatsCircle>[
  StatsCircle(
    color: const Color.fromRGBO(73, 166, 31, 1),
    label: "ALBERI PIANTATI",
    description:
        "lore ipsoidninic sdnkn csdlak ontorllare perche se aumento non si ingrandisce il cerchio var iconSize = circleSize - 150.0; ",
    icon: Image.asset("${statIconPath}forest.png"),
    size: 500,
    strokeWidth: 60,
  ),
];

class StatisticPage extends StatelessWidget {
  const StatisticPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 3,
      mainAxisSpacing: 60,
      crossAxisSpacing: 60,
      children: [...stat],
    );
  }
}
