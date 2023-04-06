import 'package:flutter/material.dart';
import 'package:totem_boschetto/views/statistic_widgets/stats_circle.dart';

const statIconPath = "/icons/statistics/";

var stat = <StatsCircle>[
  StatsCircle(
    color: const Color.fromRGBO(73, 166, 31, 1),
    label: "ALBERI PIANTATI",
    description:
        "lore ipsoidninic sdnkn csdlak ontorllare perche se aumento non si ingrandisce il cerchio var iconSize = circleSize - 150.0; ",
    icon: Image.asset("${statIconPath}forest.png"),
    value: '300',
  ),
  StatsCircle(
    color: const Color.fromRGBO(234, 156, 98, 1),
    label: "PROGETTI UNIBO COINVOLTI",
    description:
        "lore ipsoidninic sdnkn csdlak ontorllare perche se aumento non si ingrandisce il cerchio var iconSize = circleSize - 150.0; ",
    icon: Image.asset("${statIconPath}project.png"),
    value: '30/40',
  ),
  StatsCircle(
    color: const Color.fromRGBO(105, 93, 105, 1),
    label: "CO2 EVITATA",
    description:
        "lore ipsoidninic sdnkn csdlak ontorllare perche se aumento non si ingrandisce il cerchio var iconSize = circleSize - 150.0; ",
    icon: Image.asset("${statIconPath}co2.png"),
    value: '300 Kg',
  ),
  StatsCircle(
    color: const Color.fromRGBO(181, 206, 255, 1),
    label: "CARTA RISPARMIATA",
    description:
        "lore ipsoidninic sdnkn csdlak ontorllare perche se aumento non si ingrandisce il cerchio var iconSize = circleSize - 150.0; ",
    icon: Image.asset("${statIconPath}paper.png"),
    value: '30/40',
  ),
  StatsCircle(
    color: const Color.fromRGBO(254, 210, 164, 1),
    label: "CONSAPEVOLEZZA ACQUISITA",
    description:
        "lore ipsoidninic sdnkn csdlak ontorllare perche se aumento non si ingrandisce il cerchio var iconSize = circleSize - 150.0; ",
    icon: Image.asset("${statIconPath}awareness.png"),
    value: '30%',
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
